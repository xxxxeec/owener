/*

*version : v2.01

*script name : DIM_STFF (职工信息表)

*creat date : 2021-06-29

*author name : zhangxin

*/
SELECT 
	'' AS mdc_org_cd, --医疗机构代码
	t.ygdm AS stff_cd, --职工代码
	t.ygxm AS stff_nm, --职工姓名
	t.csny AS bth_dt, --出生日期
	'' AS stff_cgy_cd, --职工类别代码
	'' AS stff_cgy_nm, --职工类别名称
	t.ksdm AS afflt_dpt_cd, --所属科室代码
	k.ksmc AS afflt_dpt_nm, --所属科室名称
	'' AS afflt_wrd_cd, --所属病区代码
	'' AS afflt_wrd_nm, --所属病区名称
	'' AS edu_cd, --学历代码
	'' AS edu_nm, --学历名称
	t.ygzw AS pfs_tchnlg_fct_cgy_cd, --专业技术职务类别代码
	'' AS pfs_tchnlg_fct_nm, --专业技术职务名称
	t.ygjb AS ttl_lvl_cd, --职称级别代码
	'' AS ttl_lvl_nm, --职称级别名称
	'' AS join_dt, --入职日期
	'' AS data_mntn_stff, --数据维护员
	'' AS srgn_pms_flg, --主刀权标志
	t.kcfq AS pscp_pms_flg, --处方权标志
	t.mzyq AS aths_pscp_pms_flg, --麻醉处方权标志
	t.kssq AS antbtc_lvl_cd, --抗生素级别代码
	'' AS stff_stts_cd, --人员状态代码
	'' AS stff_stts_nm, --人员状态名称
	'' AS dct_grp_no, --医生组号
	'' AS dct_grp_nm, --医生组名称
	t.ygxb AS gdr_cd, --性别代码
	'' AS mry_cdt_cd, --婚姻状况代码
	'' AS id_crd_no, --身份证件号码
	t.lxdh AS slf_tel_no, --本人电话号码
	t.yxdz AS eml_addr, --电子邮件地址
	'' AS mdcr_dct_cd, --医保医生代码
	'' AS stff_mdcr_dpt_cd, --职工医保科室代码
	'' AS psnl_stff_cd, --人事职工代码
	'' AS etg_dt, --录入日期
	'' AS upd_dt, --更新日期
	'' AS vld_flg --有效标识
FROM bsrun.gy_ygdm t
LEFT JOIN gy_ksdm k
	ON t.ksdm = k.ksdms