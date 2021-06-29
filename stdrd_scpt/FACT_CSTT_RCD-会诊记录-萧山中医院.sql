/*
 *version      :2.01
 *script name  :FACT_CSTT_RCD(会诊记录)
 *creaet date  :2021-06-22
 *author name  :linchen
 *update date  :2021-06-29
 *update name  :linchen
*/
SELECT
	t1.sqxh AS elctrnc_apl_no,       --电子申请单编号
	t1.sqxh AS cstt_rcd_no,       --会诊记录单号
	t2.brxm AS ptt_nm,       --患者姓名
	t2.brxb AS gdr_cd,       --性别代码
	TO_CHAR(TRUNC(MONTHS_BETWEEN(sysdate, t2.csny)/12))||'岁' AS age,       --年龄（岁）
	TO_CHAR(TRUNC(MONTHS_BETWEEN(sysdate, t2.csny)))||'月' AS mon_age,       --年龄（月）
	t2.zyh AS inhos_no,       --住院号
	t2.brks AS dpt_cd,       --科室代码
	t4.ksmc AS dpt_nm,       --科室名称
	t2.brbq AS wrd_cd,       --病区代码
	t4.ksmc AS wrd_nm,       --病区名称
	'' AS room_nm,       --病房名称
	t2.brch AS bed_no,       --病床号
	t1.hzmd AS mdc_htr_smry,       --病历摘要
	t1.hzmd2 AS axlr_exam_rslt,       --辅助检查结果
	'' AS tcm_four_diag_obsv_rslt,       --中医“四诊”观察结果
	'' AS wtm_diag_nm,       --西医诊断名称
	'' AS wtm_diag_cd,       --西医诊断编码
	'' AS tcm_dses_nm,       --中医病名名称
	'' AS tcm_dses_cd,       --中医病名代码
	'' AS tcm_sptm_nm,       --中医证候名称
	'' AS tcm_sptm_cd,       --中医证候代码
	'' AS tpam,       --治则治法
	'' AS diag_trtmt_prcs_nm,       --诊疗过程名称
	'' AS diag_trtmt_prcs_dscpt,       --诊疗过程描述
	'' AS cstt_tp,       --会诊类型
	'' AS cstt_cas,       --会诊原因
	t1.hzmd AS cstt_pps,       --会诊目的
	t1.sqsj AS apl_dt_tm,       --申请日期时间
	t1.sqys AS apl_dct_cd,       --申请医生工号
	'' AS cstt_apl_dct_sgnt,       --会诊申请医师签名
	t1.sqks AS apl_dpt_cd,       --申请科室代码
	'' AS apl_mdc_org_cd,       --申请医疗机构代码
	'' AS cstt_apl_mdc_org_nm,       --会诊申请医疗机构名称
	'' AS rsvt_cstt_dt,       --预会诊日期
	t3.ksdm AS cstt_dpt_cd,       --会诊科室代码
	'' AS cstt_mdc_org_cd,       --会诊医疗机构代码
	'' AS cstt_afflt_mdc_org_nm,       --会诊所在医疗机构名称
	t3.qmys AS cstt_dct_cd,       --会诊医生代码（工号）
	'' AS cstt_dct_afflt_mdc_org_nm,       --会诊医师所在医疗机构名称
	t3.hzyj AS cstt_sgst,       --会诊意见
	'' AS cstt_dct_sgnt,       --会诊医师签名
	t3.sxsj AS cstt_dt_tm,       --会诊日期时间
	'' AS adt_tm,       --审核时间
	'' AS adt_stff_cd,       --审核职工工号
	'' AS adt_stff_nm,       --审核职工姓名
	'' AS adt_pass_flg,       --审核通过标识
	'' AS crt_rcd_dt_tm,       --建档日期时间
	'' AS crt_rcd_stff_cd,       --建档职工工号
	'' AS crt_rcd_stff_nm,       --建档者姓名
	'' AS upd_dt,       --更新日期
	'' AS upd_stff_cd,       --更新职工工号
	'' AS upd_stff_nm,       --更新职工姓名
	'' AS vld_flg       --有效标识
FROM
	bsrun.ys_zy_hzsq t1
INNER JOIN 
	bsrun.zy_brry t2 
	ON t1.jzhm=t2.zyh
LEFT JOIN 
	bsrun.ys_zy_hzyj t3 
	ON t1.sqxh=t3.sqxh
LEFT JOIN 
	bsrun.gy_ksdm t4
	ON t2.brks=t4.ksdm
LEFT JOIN 
	bsrun.gy_ksdm t5
	ON t2.brbq=t5.ksdm