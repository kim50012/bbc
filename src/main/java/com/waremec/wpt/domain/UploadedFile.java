package com.waremec.wpt.domain;

public class UploadedFile {

	private String fileName = "";
	private String filePath = "";
	private double fileSize = 0;

	public String getFileSizeName(){
		double dFileSize = fileSize / 1024 / 1024 / 1024 / 1024;
        if (0.999 < dFileSize)
        {
            return String.format("%1$9.3f TB", dFileSize).trim();
        } 
        
        dFileSize = fileSize / 1024 / 1024 / 1024;
        if (0.999 < dFileSize)
        {
            return String.format("%1$9.3f GB", dFileSize).trim();
        }
        
        dFileSize = fileSize / 1024 / 1024;
        if (0.999 < dFileSize)
        {
            return String.format("%1$9.3f MB", dFileSize).trim();
        }
        
        dFileSize = fileSize / 1024;
        if (0.999 < dFileSize)
        {
            return String.format("%1$9.3f KB", dFileSize).trim();
        }
        
        return String.format("%1$9d B", fileSize).trim();
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public double getFileSize() {
		return fileSize;
	}

	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
}
