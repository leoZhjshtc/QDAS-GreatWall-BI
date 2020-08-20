/**
 * 
 */
package cn.qdas.core.V11Webservice;

import java.util.HashMap;
import java.util.Map;

import javax.xml.rpc.ServiceException;
import javax.xml.rpc.holders.DoubleHolder;
import javax.xml.rpc.holders.IntHolder;
import javax.xml.rpc.holders.StringHolder;

import org.apache.axis.types.UnsignedByte;

/**
 * @author leo.Zhou 周钧
 * 2019年8月5日
 */
public class V11GetCpkData {
	public static Map getV11CpkData(String teilId,String merkmalId,Boolean rowsFlag,int startValue) throws Exception {
		Map dataMap =new HashMap<String,Object>();
		IQdas_Web_ServiceserviceLocator iqws=new IQdas_Web_ServiceserviceLocator("sss");
		IQdas_Web_Service client=iqws.getIQdas_Web_ServicePort();
		IntHolder webConnectResult=new IntHolder();
		IntHolder webConnectHandle=new IntHolder();
		client.webConnect(20, 44, "SuperUser", "superuser", "0.0.0.0", webConnectResult, webConnectHandle);
		int sessionHandle=webConnectHandle.value;
		IntHolder createQueryResult=new IntHolder();
		IntHolder queryHandle=new IntHolder();
		client.createQuery(sessionHandle, createQueryResult, queryHandle);
		IntHolder filterResult1=new IntHolder();
		IntHolder filterHandle1=new IntHolder();
		client.createFilterFromSQL(sessionHandle, "TETEIL="+teilId, filterResult1, filterHandle1);
		int addFilterToQuery1=client.addFilterToQuery(sessionHandle, queryHandle.value, filterHandle1.value, new UnsignedByte(0), 0, 0);
		IntHolder filterResult2=new IntHolder();
		IntHolder filterHandle2=new IntHolder();
		client.createFilterFromSQL(sessionHandle, "MEMERKMAL="+merkmalId, filterResult2, filterHandle2);
		int addFilterToQuery2=client.addFilterToQuery(sessionHandle, queryHandle.value, filterHandle2.value, new UnsignedByte(1), 0, 0);
		IntHolder filterHandle3 = null;
		if(!rowsFlag) {
			IntHolder filterResult3=new IntHolder();
			filterHandle3=new IntHolder();
			client.createFilterFromSQL(sessionHandle, "WVWERTNR>"+startValue, filterResult3, filterHandle3);
			int addFilterToQuery3= client.addFilterToQuery(sessionHandle, queryHandle.value, filterHandle3.value, new UnsignedByte(2), 0, 0);
		}
		String part_Char_List="";
		int executeQuery =client.executeQuery(sessionHandle, queryHandle.value, part_Char_List);
		int evaluateChar=client.evaluateChar(sessionHandle, 1, 1, true, 0, 0);
		
		IntHolder result1=new IntHolder();
		StringHolder statResult_str1=new StringHolder();
		DoubleHolder statResult_dbl=new DoubleHolder();
		client.getStatResult(sessionHandle, 5210, 1, 1, new UnsignedByte(0), result1, statResult_str1, statResult_dbl);
		IntHolder result2=new IntHolder();
		StringHolder statResult_str2=new StringHolder();
		DoubleHolder statResult_db2=new DoubleHolder();
		client.getStatResult(sessionHandle, 5220, 1, 1, new UnsignedByte(0), result2, statResult_str2, statResult_db2);

		dataMap.put("cp", statResult_str1);
		dataMap.put("cpk", statResult_str2);
		
		int aa =client.freeFilter(sessionHandle, filterHandle1.value);
		int bb =client.freeFilter(sessionHandle, filterHandle2.value);
		if(!rowsFlag) {
			int ee =client.freeFilter(sessionHandle, filterHandle3.value);
		}
		int cc =client.freeQuery(sessionHandle, queryHandle.value);
		int dd =client.clientDisconnect(sessionHandle);
		return dataMap;
	}
}
