package com.fas.model.fin.alys.exam;

import com.fas.cmmn.util.FasNumberUtil;

public class FinExam703 extends FinExam {

	@Override
	public boolean cal() {
		// TODO Auto-generated method stub
		boolean re = false;
		try {
			re = FasNumberUtil.isFirstGreater(this.finRatio , this.finBokRatio);
		} catch(Exception ex) {
			
		}
		return re;
	}

}