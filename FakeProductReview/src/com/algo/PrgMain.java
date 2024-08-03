package com.algo;

import java.util.Iterator;
import java.util.Vector;


public class PrgMain {
    public static void main (String args[]){
    	
    	
        Vector dataPoints = new Vector();
        dataPoints.add(new DataPoint(22,21,"p53"));
        dataPoints.add(new DataPoint(19,20,"bcl2"));
        dataPoints.add(new DataPoint(18,22,"fas"));
        dataPoints.add(new DataPoint(1,3,"amylase"));
        dataPoints.add(new DataPoint(3,2,"maltase"));

        SVM svm = new SVM(2,1000,dataPoints);
        svm.startAnalysis();

        Vector[] v = svm.getClusterOutput();
        for (int i=0; i<v.length; i++){
            Vector tempV = v[i];
            System.out.println("-----------Cluster"+i+"---------");
            Iterator iter = tempV.iterator();
            while(iter.hasNext()){
                DataPoint dpTemp = (DataPoint)iter.next();
                System.out.println(dpTemp.getObjName()+"["+dpTemp.getX()+","+dpTemp.getY()+"]");
            }
        }
    
    }

	private static void calculate() {
		// TODO Auto-generated method stub
		
	}
} 