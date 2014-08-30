package com.terry.springsecurity.common.util;

import java.lang.Math;

public class Util {

	/**
	 * VB의 CInt 함수를 java로 구현한 것이다.
	 * 단순히 생각하면 int 형으로 변환하는 것이지만 여기에는 규칙이 있다.
	 * 소숫점이 0.5로 떨어지는 경우에는 반올림 규칙이 약간 달라지는데 가장 가까운 짝수로 간다는 것이다.
	 * 즉 0.5->0, 1.5->2, 2.5->2, 3.5->4 이렇다는 것이다
	 * 이걸 제외한 나머지 경우 즉 0.5로 끝나는것이 아닌 경우(0.49999..나 0.5111111 머 이런것들..)은 일반 반올림 로직을 따라간다
	 * @param param
	 * @return
	 */
	public static int CInt(float param){
		int result = 0;
		
		double floor =  Math.floor(param);
		// 입력받은 param에서 입력받은 param 값을 소숫점 버리는 값으로 변환해서 뺀 것의 절대값이 0.5 차이가 나면 딱 0.5로 떨어진 것이기 때문에..
		if(Math.abs(param - floor) == 0.5){
			int temp = Math.round(param);
			
			if(temp % 2 == 0){
				result = temp;
			}else{
				result = temp - 1;
			}
		}else{
			result = Math.round(param);
		}
		
		return result;
	}
}
