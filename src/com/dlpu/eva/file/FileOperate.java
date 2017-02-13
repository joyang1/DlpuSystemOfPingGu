package com.dlpu.eva.file;

import java.io.File;
import java.io.FileOutputStream;

import javax.persistence.Entity;
import org.apache.struts.upload.FormFile;

@Entity
public class FileOperate {

	/**
	 * Save one file
	 * 
	 * @param path
	 *            The URL which want to save
	 * @param fileName
	 *            The fileName which want to save
	 * @param aFile
	 *            The file which want to save
	 * @return true: save success | false: save fail
	 */
	public boolean AddOneFile(String path, String fileName, FormFile aFile) {
		try {
			FileOutputStream fos = new FileOutputStream(path + fileName);
			fos.write(aFile.getFileData()); // Save file
			fos.flush();
			fos.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * Delete One file in disk
	 * 
	 * @param path
	 *            where the file is
	 * @param fileName
	 *            the file which want to delete
	 * @param stricts
	 *            true: tell the file if is not exists | false: suggest this
	 *            value, which do not tell if not exists
	 * @return true: file delete success | false :file does not exists or other
	 *         reason
	 */
	public boolean DelOneFile(String path, String fileName, boolean strict) {

		File delFile = new File(path + fileName);
		try {
			if (delFile.exists()) {// if file exists
				delFile.delete();
			} else {
				if (strict) {
					return false;// file not exists
				}
			}
		} catch (Exception e) {
			return false;// no power to delete
		}
		return true;
	}

}
