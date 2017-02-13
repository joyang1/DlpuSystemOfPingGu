package com.dlpu.eva.mymd5;

import java.security.MessageDigest;
import javax.persistence.Entity;

@Entity
public class MyMD5 {
	
	
	/**
     * ���ַ����MD5����
     *
     * @param orgString ԭ�ַ�
     * @return ���ؽ���16���Ʊ�����MD5�����ַ���
     */
    public String MD5Encoding(String orgString) {
        String md5string;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] str = md5.digest(orgString.getBytes("utf-8"));
            md5string = bytetoString(str);
        } catch (Exception ex) {
            md5string = orgString;
        }
        return md5string;
    }

    /**
     * ��MD5���ܺ���ַ���ת����16������
     *
     * @param digest
     * @return
     */
    private String bytetoString(byte[] digest) {

        String str = "";
        String tempStr;
        for (int i = 0; i < digest.length; i++) {
            tempStr = (Integer.toHexString(digest[i] & 0xff));
            if (tempStr.length() == 1) {
                str = str + "0" + tempStr;
            } else {
                str = str + tempStr;
            }
        }
        return str.toLowerCase();
    }
	
}
