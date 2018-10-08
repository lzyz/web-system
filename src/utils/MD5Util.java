package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
    public MD5Util()
    {
    }
    private final static char[] chars  = {
    		'0','1','2','3',
			'4','5','6','7',
			'8','9','a','b',
			'c','d','e','f'
    };
    private static String byteToArrayString(byte bByte)
    {
    	int iRet = bByte;
    	if(iRet<0)
    	{
    		iRet += 256;
    	}
    	int index1 = iRet / 16;
    	int index2 = iRet % 16;
    	
    	return String.valueOf(chars[index1])+String.valueOf(chars[index2]);
    }
    private static String byteToNum(byte bByte)
    {
    	int iRet = bByte;
    	if(iRet<0){
    		bByte += 256;
    	}
    	return String.valueOf(iRet);
    }
    private static String byteToString(byte[] bByte)
    {
    	StringBuffer buffer = new StringBuffer();
    	int len = bByte.length;
    	for(int i=0;i<len;i++)
    	{
    		buffer.append(byteToArrayString(bByte[i]));
    	}
    	return buffer.toString();
    }
    public static String getMD5Code(String strObj)
    {
    	String resultString = null;
    	resultString = new String(strObj);
    	try{
    	    MessageDigest md = MessageDigest.getInstance("MD5");
    	    resultString = byteToString(md.digest(strObj.getBytes()));
    	}catch(NoSuchAlgorithmException e){
    		e.printStackTrace();
    	}
    	return resultString;
    }
}
