import control.Control;
import org.antlr.runtime.RecognitionException;
import util.MultiThreadUtils.*;
import vm.BootstrapClassLoader;
import vm.VM;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;


public class CompilePass {
	private static ArrayList<File> getAllSmali(File startPoint) {
		ArrayList<File> result = new ArrayList<File>();
		for (File f : startPoint.listFiles()) {
			if (f.isFile() && f.getAbsolutePath().endsWith(".smali"))
				result.add(f);
			else if (f.isDirectory())
				result.addAll(getAllSmali(f));
		}
		return result;
	}

	/* *
	 * NOTE, we don't do the real work here, because if we do, it will consume a
	 * lot of memory.
	 */
	public static List<ParserWorker> parseSmaliFile(File path) {
		ArrayList<File> files = getAllSmali(path);
		ArrayList<ParserWorker> result = new ArrayList<ParserWorker>();

		for (File f : files)
			result.add(new ParserWorker(f.getAbsolutePath()));

		return result;
	}

	public static List<TranslateWorker> translate(List<ParserWorker> workers) {
		ArrayList<TranslateWorker> result = new ArrayList<TranslateWorker>();

		for (ParserWorker parserWorker : workers)
			result.add(new TranslateWorker(parserWorker));

		return result;
	}

	public static List<SimplifyWorker> simplify(List<TranslateWorker> workers) {
		ArrayList<SimplifyWorker> result = new ArrayList<SimplifyWorker>();

		for (TranslateWorker translateWorker : workers)
			result.add(new SimplifyWorker(translateWorker));

		return result;
	}

	public static void prettyPrintSim(List<SimplifyWorker> workers)
			throws RecognitionException, ExecutionException {
		ExecutorService executor = Executors
				.newFixedThreadPool(Control.numWorkers);

		for (SimplifyWorker worker : workers)
			executor.submit(new PrettyPrintSimWorker(worker));

		executor.shutdown();
		while (true) {
			try {
				executor.awaitTermination(Long.MAX_VALUE, TimeUnit.SECONDS);
				break;
			} catch (InterruptedException e) {
				continue;
			}
		}
	}

	public static void prettyPrint(List<TranslateWorker> workers)
			throws RecognitionException, ExecutionException {
		ExecutorService executor = Executors
				.newFixedThreadPool(Control.numWorkers);

		for (TranslateWorker worker : workers)
			executor.submit(new PrettyPrintWorker(worker));

		executor.shutdown();
		while (true) {
			try {
				executor.awaitTermination(Long.MAX_VALUE, TimeUnit.SECONDS);
				break;
			} catch (InterruptedException e) {
				continue;
			}
		}
	}

	/*
	 * format of worker.parserWorker.path : /tmp/output/com/example/Main.smali
	 * format of className : Lcom/example/Main;
	 */
	public static void  startUpVm(List<TranslateWorker> workers,
			String mainClazzName) throws ClassNotFoundException,
			NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		Map<String, TranslateWorker> clazzMap = new HashMap<String, TranslateWorker>();
		for (TranslateWorker worker : workers) {
			String className = worker.parserWorker.path;
            System.out.println(className);
//            className = "L"
//					+ className.substring(Control.apkoutput.length() + 7,
//							className.length() - 6) + ";";

            className = className.substring(Control.apkoutput.length() + 1);
            className = className.replaceAll(".smali", "");
            className = className.replace('\\', '/'); // For windows.
            className = "L" + className + ";";
            System.out.println("className: " + className);
            clazzMap.put(className, worker);
		}

        BootstrapClassLoader bootstrapClassLoader = new BootstrapClassLoader(clazzMap);
		VM vm = new VM(bootstrapClassLoader, mainClazzName);
        try{
            vm.start();
        }catch (Throwable e){
            e.printStackTrace();
        }

	}
}