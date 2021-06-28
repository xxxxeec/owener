/*

*version : v2.01

*script name : FACT_OTPT_VST_INFMT (门诊就诊信息)

*creat date : 2021-06-28

*author name : zhangxin

*/

SELECT 
jz.jgid AS mdc_org_cd, --医疗机构代码
jz.brbh AS otpt_no, --门诊号
jz.ghxh AS rgst_no, --挂号流水号
'' AS otpt_oprt_no ,--门诊手术号
ms.brxm AS ptt_nm, --患者姓名
ms.brxb AS gdr_cd, --性别代码
ms.csny AS bth_dt, --出生日期
trunc(months_between(ms.jzrq, ms.csny)/12) AS age, --年龄（岁）
'' AS mon_age, --年龄（月）
jz.jzxh AS vst_tms, --就诊次数
'' AS vst_crd_no, --就诊卡号
'' AS mdcr_cgy_cd, --医疗保险类别代码
yj.yjxh AS otpt_exam_no, --门诊检查号
yj.yjxh AS otpt_test_no, --门诊检验号
jz.jzlx AS ptt_ntr_cd, --患者性质代码
jz.ksdm AS vst_dpt_cd, --患者科室代码
k.ksmc AS vst_dpt_nm, --就诊科室名称
jz.ysdm AS vst_dct_cd, --就诊医生
yg.ygxm AS vst_dct_nm ,--就诊医生名称
ms.jzrq AS vst_dt_tm, --就诊日期时间
jz.kssj AS vst_strt_tm, --就诊开始时间
jz.jssj AS vst_end_tm, --就诊结束时间
jd.icd AS otpt_diag_cd, --门诊诊断代码
jd.jbmc AS otpt_diag_nm, --门诊诊断名称
gh.ghlb AS rgst_cgy_cd, --挂号类别代码
'' AS vst_pps_cd, --就诊目的代码
'' AS emg_flg, --急诊标识
jd.jbzg AS ptt_whrabt_cd, --患者去向代码
ms.jdsj AS crt_rcd_dt_tm ,--建档日期时间
ms.jdr AS crt_rcd_stff_cd, --建档职工工号
yg.ygxm AS crt_rcd_stff_nm, --建档者姓名
ms.xgsj AS upd_dt, --更新日期
'' AS upd_stff_cd, --更新职工工号
'' AS upd_stff_nm, --更新职工姓名
'' AS vld_flg --有效标识
FROM bsrun.ys_mz_jzls jz
INNER JOIN bsrun.ms_brda ms 
	ON jz.brbh = ms.brid
LEFT JOIN bsrun.gy_ygdm yg
	ON yg.ygdm=jz.ysdm
LEFT JOIN bsrun.gy_ksdm k
	ON JZ.KSDM = K.KSDM
LEFT JOIN bsrun.ys_mz_jbzd jd
	ON jz.jzxh=jd.jzxh
LEFT JOIN bsrun.ms_ghmx gh
	ON gh.sbxh=jz.ghxh
LEFT JOIN bsrun.ms_yj02 yj
	ON yj.sbxh=jz.jzxh