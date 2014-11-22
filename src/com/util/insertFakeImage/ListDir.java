package com.util.insertFakeImage;
import java.io.*;

public class ListDir {
	File file;
	String srcPath;
	
	ListDir(String srcPath){
		this.file = new File(srcPath);
		this.srcPath = srcPath;
	}
	
	public int getTotalFilesNum(){	
		if (!file.isDirectory()) {
			System.out.println("Not a directory");
			return 0;
		}
		File[] contents = file.listFiles();
		return contents.length;
	}
	public File[] getFiles(){
		if (!file.isDirectory()) {
			System.out.println("Not a directory");
			return null;
		}
		File[] contents = file.listFiles();
		return contents;
	}
	
	//檢查多出圖片
	public boolean checkIlegal(){
		int totalFilesNum = getTotalFilesNum();
		String[] contents = file.list();
		boolean isRight = false;
		boolean result = true;
		
		System.out.println("檢查路徑:"+srcPath);
		for(int i=0;i<totalFilesNum;i++){ //給字串陣列用
			isRight = false;
			for(int j=1;j<=totalFilesNum;j++){ //給圖片名稱用
				if(contents[i].equals(j+".jpg")){//如果有找到符合名稱就break
					//System.out.println("contents[j]="+contents[j]);
					isRight = true;
					break ;
				}				
			}	
			//進入到此表示都沒有找到合適的檔案名稱表示有錯誤
			if(isRight == false){
				System.out.println("多出的檔名:"+contents[i]);				
				result = false;
			}
		}
		//檢查缺少圖片
		for(int i=1;i<=totalFilesNum;i++){//給圖片名稱用
			isRight = false;
			for(int j=0;j<totalFilesNum;j++){ //給字串陣列用
				if(contents[j].equals(i+".jpg")){//如果有找到符合名稱就break
					//System.out.println("contents[j]="+contents[j]);
					isRight = true;
					break ;
				}				
			}	
			//進入到此表示都沒有找到合適的檔案名稱表示有錯誤
			if(isRight == false){
				System.out.println("缺少檔名:"+i+".jpg");
				result = false;
			}
		}	
		if(result)
			System.out.println("路徑檔案驗證OK:"+srcPath);	
		return result;
	}
	
	public static void main(String[] args) {
		String srcPath = "WebContent/img/cars";
		ListDir lisdir = new ListDir(srcPath);
		if(lisdir.checkIlegal()){
			System.out.println("檢查結果正確");
		}else{
			System.out.println("檢查結果錯誤");
		}
	}
	
//	public static void main(String[] args) {
//		String srcPath = "WebContent/img/cars";
//		File file = new File(srcPath);
//		if (!file.isDirectory()) {
//			System.out.println("Not a directory");
//		//	System.exit(0);
//			return;
//		}
//		StringBuilder sb = new StringBuilder(300);
//	//	String[] contents = file.list();
//		File[] contents = file.listFiles();
//		for (int i = 0; i < contents.length; i++) {
//			sb.append((contents[i].isFile()) ? "[File]" : "[Directory]");
//			sb.append(contents[i].getName());
//		//	sb.append((contents[i].isFile()) ? "" : "\\");
//			sb.append("\n");
//		}
//		System.out.print(sb);
//	}
}
