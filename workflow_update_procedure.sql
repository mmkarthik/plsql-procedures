CREATE DEFINER=`karthik`@`%` PROCEDURE `workflow_update_procedure`(p_count_workflow_id int ,p_cnt_approved int,p_table_name varchar(245), p_current_workflow_id int, p_new_workflow_id int,  p_record_id int, p_column_name varchar(145), p_current_value text, p_current_description text , p_verified_by int )
    DETERMINISTIC
BEGIN
-- Modified - 06-Nov-2019 - included verified_by - ver 1.1
-- Modified: 15-sep-2019 Ref:SCBTD 402 By:Karthik Ver:1
-- Created : 6-aug-2019	 Ref:SCBTD-156 By:Karthik Ver:1
DECLARE lvv_cnt_approved int;
DECLARE lvv_count_workflow_id int;
DECLARE lv_new_workflow_id int;
DECLARE lv_current_workflow_id int;
DECLARE lv_current_value text;
DECLARE lv_fund_id int;
DECLARE lv_funds_id int;

set lv_new_workflow_id := p_new_workflow_id;
set lv_current_workflow_id := p_current_workflow_id;
set lv_current_value := p_current_value;
set lvv_cnt_approved := p_cnt_approved;
set lvv_count_workflow_id := p_count_workflow_id;
IF p_table_name = 'funds' THEN
	
    -- INSERT INTO Debug_log SELECT now(), concat('p_column_name : ', p_column_name);
	-- INSERT INTO Debug_log SELECT now(), concat('lv_current_value : ', lv_current_value);
	-- INSERT INTO Debug_log SELECT now(), concat('p_record_id : ', p_record_id); 
	-- INSERT INTO Debug_log SELECT now(), concat('lvv_count_workflow_id : ', lvv_count_workflow_id);
	-- INSERT INTO Debug_log SELECT now(), concat('lvv_cnt_approved : ', lvv_cnt_approved); 
	-- INSERT INTO Debug_log SELECT now(), concat('p_new_workflow_id : ',p_new_workflow_id);
	
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE funds SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
	   UPDATE funds SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
	   UPDATE funds SET fund_manager_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'fund_type_id' THEN
	   UPDATE funds SET workflow_id = 3 where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_type_id' THEN
	   UPDATE funds SET fund_type_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_type_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'fund_category_id' THEN
	   UPDATE funds SET workflow_id = 3 where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_category_id' THEN
	   UPDATE funds SET  fund_category_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_category_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE funds SET workflow_id = 3 where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE funds SET bank_branch_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id = 3 AND p_column_name= 'currency_id' THEN
		UPDATE funds SET workflow_id = 3 where id= p_record_id;
    END IF;
    IF p_new_workflow_id = 3 AND p_column_name= 'currency_id' THEN
		UPDATE funds SET  currency_id=lv_current_value where id= p_record_id; -- workflow_id = 3,
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
  	IF p_new_workflow_id=3 AND p_column_name= 'nav_valuation_point_id' THEN
	   UPDATE funds SET workflow_id = 3 , nav_valuation_point_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'nav_valuation_point_id' THEN
	   UPDATE funds SET nav_valuation_point_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'nav_valuation_point_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'finance_auditor_id' THEN
	   UPDATE funds SET workflow_id = 3 , finance_auditor_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finance_auditor_id' THEN
	   UPDATE funds SET finance_auditor_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finance_auditor_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'finance_tax_agent_id' THEN
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finance_tax_agent_id' THEN
	   UPDATE funds SET finance_tax_agent_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finance_tax_agent_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- s2b_group_id ----------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 's2b_group_id' THEN
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 's2b_group_id' THEN
	   UPDATE funds SET s2b_group_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 's2b_group_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- ---------------------------------------------------------------
	IF p_new_workflow_id=3 AND p_column_name= 'fs_template_id' THEN
	   UPDATE funds SET workflow_id = 3 , fs_template_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fs_template_id' THEN
	   UPDATE funds SET fs_template_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fs_template_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
	   UPDATE funds SET workflow_id = 3 , country_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
	   UPDATE funds SET country_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'internal_code' THEN
	   UPDATE funds SET workflow_id = 3 , internal_code = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'internal_code' THEN
	   UPDATE funds SET internal_code = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'internal_code' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'external_code' THEN
	   UPDATE funds SET workflow_id = 3 , external_code = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'external_code' THEN
	   UPDATE funds SET external_code = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'external_code' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	
	IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE funds SET workflow_id = 3 , name = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE funds SET name = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE funds SET workflow_id = 3 , category = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE funds SET category = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'fs_report_finalized' THEN
	   UPDATE funds SET workflow_id = 3 , fs_report_finalized = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fs_report_finalized' THEN
	   UPDATE funds SET fs_report_finalized = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fs_report_finalized' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'none' THEN
	   UPDATE funds SET workflow_id = 3 , none = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'none' THEN
	   UPDATE funds SET none = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'none' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	   UPDATE funds SET workflow_id = 3 , launch_date = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	   UPDATE funds SET launch_date = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'distribution_mode' THEN
	   UPDATE funds SET workflow_id = 3 , distribution_mode = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'distribution_mode' THEN
	   UPDATE funds SET distribution_mode = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'distribution_mode' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'nav_threshold' THEN 
	   UPDATE funds SET workflow_id = 3 , nav_threshold = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'nav_threshold' THEN 
	   UPDATE funds SET nav_threshold = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'nav_threshold' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'status' THEN 
	   UPDATE funds SET workflow_id = 3 , status = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'status' THEN 
	   UPDATE funds SET status = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'status' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'trustee_fee' THEN 
	   UPDATE funds SET workflow_id = 3 , trustee_fee = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'trustee_fee' THEN 
	   UPDATE funds SET trustee_fee = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'trustee_fee' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'min_trustee_fee' THEN 
	   UPDATE funds SET workflow_id = 3 , min_trustee_fee = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'min_trustee_fee' THEN 
	   UPDATE funds SET min_trustee_fee = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'min_trustee_fee' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'max_trustee_fee' THEN 
	   UPDATE funds SET workflow_id = 3 , max_trustee_fee = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'max_trustee_fee' THEN 
	   UPDATE funds SET max_trustee_fee = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'max_trustee_fee' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     -- legal_entity_identifier
    IF p_new_workflow_id=3 AND p_column_name= 'legal_entity_identifier' THEN 
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'legal_entity_identifier' THEN 
	   UPDATE funds SET legal_entity_identifier = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'legal_entity_identifier' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
   -- fs_report_finalized 
   IF p_new_workflow_id=3 AND p_column_name= 'fs_report_finalized' THEN 
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fs_report_finalized' THEN 
	   UPDATE funds SET fs_report_finalized = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fs_report_finalized' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- frr 
    IF p_new_workflow_id=3 AND p_column_name= 'frr' THEN 
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'frr' THEN 
	   UPDATE funds SET frr = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'frr' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- td 
    IF p_new_workflow_id=3 AND p_column_name= 'td' THEN 
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'td' THEN 
	   UPDATE funds SET td = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'td' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- distribution_mode_id
    IF p_new_workflow_id=3 AND p_column_name= 'distribution_mode_id' THEN 
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'distribution_mode_id' THEN 
	   UPDATE funds SET distribution_mode_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'distribution_mode_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- sca_id
     IF p_new_workflow_id=3 AND p_column_name= 'sca_id' THEN 
	   UPDATE funds SET workflow_id = 3  where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'sca_id' THEN 
	   UPDATE funds SET sca_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'sca_id' THEN
	   UPDATE funds SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     
    IF p_new_workflow_id=4 THEN
		UPDATE funds SET workflow_id=4 where id= p_record_id;
    END IF;
END IF;

IF p_table_name = 'fund_managers' THEN
	
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   
		IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_managers SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_managers SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id;
		END IF;
        
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE fund_managers SET code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE fund_managers SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'company_no' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'company_no' THEN
	   UPDATE fund_managers SET company_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'company_no' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'legal_identity_identifier' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'legal_identity_identifier' THEN
	   UPDATE fund_managers SET legal_identity_identifier = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'legal_identity_identifier' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'leid_last_renewal_date' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'leid_last_renewal_date' THEN
	   UPDATE fund_managers SET leid_last_renewal_date = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'leid_last_renewal_date' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'leid_next_expiry_date' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'leid_next_expiry_date' THEN
	   UPDATE fund_managers SET leid_next_expiry_date = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'leid_next_expiry_date' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'annual_compliance_review_date' THEN
	   UPDATE fund_managers SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'annual_compliance_review_date' THEN
	   UPDATE fund_managers SET annual_compliance_review_date = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'annual_compliance_review_date' THEN
	   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
END IF;    
IF p_table_name = 'fund_manager_contacts' THEN
    SELECT fund_manager_id INTO lv_fund_id FROM fund_manager_contacts WHERE id=p_record_id;
    SELECT id INTO lv_funds_id FROM fund_managers WHERE id=lv_fund_id;

    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE fund_managers SET workflow_id=2 where id= lv_fund_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_managers SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_managers SET verified_by=p_verified_by where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE fund_manager_contacts SET workflow_id=2 where id= lv_fund_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_manager_contacts SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_manager_contacts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF; 
  
	-- 	--------------------- fund_manager_id -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
       -- INSERT INTO Debug_log SELECT now(),'workflow_update_procedure', concat('fund_class.fund_id Updated , p_record_id : ', p_record_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
	   UPDATE fund_manager_contacts SET fund_manager_id = lv_current_value where id= p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_manager_contacts SET verified_by=p_verified_by  where id= p_record_id; 
    END IF;
  -- 	--------------------- department_id -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'department_id' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
		-- INSERT INTO Debug_log SELECT now(), 'workflow_update_procedure', concat('fund.workflow_id Updated , lv_funds_id : ', lv_funds_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'department_id' THEN
		UPDATE fund_managers SET verified_by=p_verified_by  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'department_id' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
       -- INSERT INTO Debug_log SELECT now(),'workflow_update_procedure', concat('fund_class.fund_id Updated , p_record_id : ', p_record_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'department_id' THEN
	   UPDATE fund_manager_contacts SET department_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'department_id' THEN
		UPDATE fund_manager_contacts SET verified_by=p_verified_by  where id= p_record_id; 
    END IF;
    -- 	--------------------- first_name -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'first_name' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
		-- INSERT INTO Debug_log SELECT now(), 'workflow_update_procedure', concat('fund.workflow_id Updated , lv_funds_id : ', lv_funds_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'first_name' THEN
		UPDATE fund_managers SET verified_by=p_verified_by  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'first_name' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
       -- INSERT INTO Debug_log SELECT now(),'workflow_update_procedure', concat('fund_class.fund_id Updated , p_record_id : ', p_record_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'first_name' THEN
	   UPDATE fund_manager_contacts SET first_name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'first_name' THEN
		UPDATE fund_manager_contacts SET verified_by=p_verified_by  where id= p_record_id; 
    END IF;
    -- 	--------------------- middle_name -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'middle_name' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'middle_name' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'middle_name' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'middle_name' THEN
	   UPDATE fund_manager_contacts SET middle_name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'middle_name' THEN
	   UPDATE fund_manager_contacts SET verified_by = p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- last_name -------------------------------
     IF p_new_workflow_id=3 AND p_column_name= 'last_name' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
		-- INSERT INTO Debug_log SELECT now(), 'workflow_update_procedure', concat('fund.workflow_id Updated , lv_funds_id : ', lv_funds_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'last_name' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'last_name' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
       -- INSERT INTO Debug_log SELECT now(),'workflow_update_procedure', concat('fund_class.fund_id Updated , p_record_id : ', p_record_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'last_name' THEN
	   UPDATE fund_manager_contacts SET last_name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'last_name' THEN
	   UPDATE fund_manager_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- email_address -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
       -- INSERT INTO Debug_log SELECT now(),'workflow_update_procedure', concat('fund_class.fund_id Updated , p_record_id : ', p_record_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE fund_manager_contacts SET email_address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE fund_manager_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- direct_no -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
       -- INSERT INTO Debug_log SELECT now(),'workflow_update_procedure', concat('fund_class.fund_id Updated , p_record_id : ', p_record_id);
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
	   UPDATE fund_manager_contacts SET direct_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
	   UPDATE fund_manager_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- mobile_no -------------------------------
     IF p_new_workflow_id=3 AND p_column_name= 'mobile_no' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	 END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'mobile_no' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	 END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'mobile_no' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'mobile_no' THEN
	   UPDATE fund_manager_contacts SET mobile_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'mobile_no' THEN
	   UPDATE fund_manager_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- date_created -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'date_created' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'date_created' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'date_created' THEN
		UPDATE fund_manager_contacts SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'date_created' THEN
	   UPDATE fund_manager_contacts SET date_created = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'date_created' THEN
	   UPDATE fund_manager_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
   
END IF;  
IF p_table_name = 'fund_manager_address' THEN
	 SELECT fund_manager_id INTO lv_fund_id FROM fund_manager_address WHERE id=p_record_id;
    SELECT id INTO lv_funds_id FROM fund_managers WHERE id=lv_fund_id;
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE fund_managers SET workflow_id=2 where id= lv_fund_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE fund_managers SET status='active' where id= lv_fund_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE fund_manager_address SET workflow_id = 2  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE fund_manager_address SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE fund_manager_address SET verified_by=p_verified_by  where id= p_record_id; 
		END IF;
    END IF; 
   
	-- 	--------------------- fund_manager_id -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
	   UPDATE fund_manager_address SET fund_manager_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_manager_id' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- address_type_id -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'address_type_id' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address_type_id' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address_type_id' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address_type_id' THEN
	   UPDATE fund_manager_address SET address_type_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address_type_id' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- country_id -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
	   UPDATE fund_manager_address SET country_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'country_id' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- description_1 -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'description_1' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_1' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_1' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
     END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_1' THEN
	   UPDATE fund_manager_address SET description_1 = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_1' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- description_2 -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'description_2' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_2' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_2' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_2' THEN
	   UPDATE fund_manager_address SET description_2 = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'description_2' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- email_address -------------------------------
	IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE fund_manager_address SET email_address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- zip_code -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'zip_code' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'zip_code' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'zip_code' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'zip_code' THEN
	   UPDATE fund_manager_address SET zip_code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'zip_code' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 	--------------------- city -------------------------------
	IF p_new_workflow_id=3 AND p_column_name= 'city' THEN
		UPDATE fund_managers SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'city' THEN
		UPDATE fund_managers SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'city' THEN
		UPDATE fund_manager_address SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'city' THEN
	   UPDATE fund_manager_address SET city = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'city' THEN
	   UPDATE fund_manager_address SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
      
END IF;  
IF p_table_name = 'finance_auditors' THEN
	
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE finance_auditors SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE finance_auditors SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE finance_auditors SET verified_by=p_verified_by where id= p_record_id;
		END IF;
     END IF;
    
    
	IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE finance_auditors SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE finance_auditors SET workflow_id = p_new_workflow_id where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE finance_auditors SET verified_by=p_verified_by where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	   UPDATE finance_auditors SET address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
		UPDATE finance_auditors SET workflow_id = p_new_workflow_id where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
		UPDATE finance_auditors SET verified_by=p_verified_by where id=p_record_id; 
    END IF;
    
    
END IF;
IF p_table_name = 'finance_tax_agents' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE finance_tax_agents SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN -- Approved
		   UPDATE finance_tax_agents SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE finance_tax_agents SET verified_by=p_verified_by where id= p_record_id;
		END IF;
   END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE finance_tax_agents SET code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
		UPDATE finance_tax_agents SET workflow_id = p_new_workflow_id where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
		UPDATE finance_tax_agents SET verified_by=p_verified_by where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE finance_tax_agents SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE finance_tax_agents SET workflow_id = p_new_workflow_id where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE finance_tax_agents SET verified_by=p_verified_by where id=p_record_id; 
    END IF;
END IF;
IF p_table_name = 'banks' THEN
	
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE banks SET workflow_id=2 where id= p_record_id;
		END IF; 
        IF p_new_workflow_id=2 THEN
			UPDATE banks SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE banks SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    
        -- 		-------------- code -------------------
	IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
		UPDATE banks SET workflow_id = p_new_workflow_id where id=p_record_id; 
    END IF;	
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
		UPDATE banks SET code = lv_current_value where id= p_record_id; 
    END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
		UPDATE banks SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
     -- 		-------------- name -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE banks SET workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE banks SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE banks SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    -- 		-------------- swift_code -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'swift_code' THEN
	   UPDATE banks SET workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'swift_code' THEN
	   UPDATE banks SET swift_code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'swift_code' THEN
	   UPDATE banks SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
     -- 		-------------- account_no -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE banks SET workflow_id = p_new_workflow_id where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE banks SET account_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE banks SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
END IF;
IF p_table_name = 'bank_branches' THEN
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE bank_branches SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE bank_branches SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE bank_branches SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
   
    IF p_new_workflow_id=3 AND p_column_name= 'workflow_id' THEN
	    UPDATE bank_branches SET workflow_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_id' THEN
	    UPDATE bank_branches SET bank_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_id' THEN
        UPDATE bank_branches SET workflow_id = p_new_workflow_id where id=p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_id' THEN
        UPDATE bank_branches SET verified_by=p_verified_by where id=p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	    UPDATE bank_branches SET code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	    UPDATE bank_branches SET workflow_id = p_new_workflow_id where id=p_record_id;  
	 END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	    UPDATE bank_branches SET verified_by=p_verified_by where id=p_record_id;  
	 END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	    UPDATE bank_branches SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	    UPDATE bank_branches SET workflow_id = p_new_workflow_id where id=p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	    UPDATE bank_branches SET verified_by=p_verified_by where id=p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
		 UPDATE bank_branches SET address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	    UPDATE bank_branches SET workflow_id = p_new_workflow_id where id=p_record_id; 
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	    UPDATE bank_branches SET verified_by=p_verified_by where id=p_record_id; 
	END IF;
END IF;
IF p_table_name = 'bank_branch_contacts' THEN
	
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE bank_branch_contacts SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE bank_branch_contacts SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE bank_branch_contacts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
        
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE bank_branch_contacts SET bank_branch_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE bank_branch_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE bank_branch_contacts SET contact_person = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE bank_branch_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
	   UPDATE bank_branch_contacts SET direct_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'direct_no' THEN
	   UPDATE bank_branch_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'extension_no' THEN
	   UPDATE bank_branch_contacts SET extension_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'extension_no' THEN
	   UPDATE bank_branch_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE bank_branch_contacts SET email_address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE bank_branch_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
END IF;
	
 IF p_table_name = 'fund_classes' THEN -- SCBTD 156
	SELECT fund_id INTO lv_fund_id FROM fund_classes WHERE id=p_record_id;
    SELECT id INTO lv_funds_id FROM funds WHERE id=lv_fund_id;
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- handle all approved
    -- IF p_count_workflow_id = p_cnt_approved THEN
     -- INSERT INTO debug_log SELECT now(), 'inside',concat(p_count_workflow_id+': '+p_cnt_approved);
	-- INSERT INTO debug_log SELECT now(), concat('Inside  '+ lvv_cnt_approved),concat('lvvount workif'+lvv_count_workflow_id);
		IF p_new_workflow_id=2 THEN
		   UPDATE fund_classes SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE fund_classes SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET workflow_id=2 where id= lv_fund_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id;
		END IF;
    END IF; 
   
	-- 	--------------------- fund_id -------------------------------
    
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
		UPDATE funds SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
		UPDATE funds SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
		UPDATE fund_classes SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_classes SET fund_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;

    -- 		-------------- currency_id -------------------
    
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
		UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
		UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
		UPDATE fund_classes SET workflow_id = p_new_workflow_id  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_classes SET fund_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 		-------------- name -------------------
       
    
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE fund_classes SET  workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE fund_classes SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 		-------------- management_fee -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
		UPDATE fund_classes SET  workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
		UPDATE fund_classes SET management_fee = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
		UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 		-------------- launch_date -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	  UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	  UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
		UPDATE fund_classes SET  workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
		UPDATE fund_classes SET management_fee = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
		UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
   	-- 	--------------------- fund_id -------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
		UPDATE funds SET workflow_id = 3 where id= lv_fund_id; -- p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
		UPDATE funds SET verified_by=p_verified_by where id= lv_fund_id; -- p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
		UPDATE fund_classes SET workflow_id = 3  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_classes SET fund_id = lv_current_value where id= p_record_id; 
    END IF;
     IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;

    -- 		-------------- currency_id -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
		UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
		UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
		UPDATE fund_classes SET workflow_id = p_new_workflow_id  where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_classes SET fund_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 		-------------- name -------------------
       
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE fund_classes SET  workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE fund_classes SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 		-------------- management_fee -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
		UPDATE fund_classes SET  workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
		UPDATE fund_classes SET management_fee = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'management_fee' THEN
		UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- 		-------------- launch_date -------------------
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	  UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
	  UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
		UPDATE fund_classes SET  workflow_id = p_new_workflow_id where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
		UPDATE fund_classes SET management_fee = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'launch_date' THEN
		UPDATE fund_classes SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
 END IF; 

IF p_table_name = 's2b_groups' THEN
	
    IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE s2b_groups SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE s2b_groups SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE s2b_groups SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE s2b_groups SET code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE s2b_groups SET workflow_id = p_new_workflow_id where p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE s2b_groups SET verified_by=p_verified_by where p_record_id; 
    END IF;
END IF;
-- counterparty update 
 IF p_table_name = 'counterparty' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE counterparty SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE counterparty SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE counterparty SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    -- category
    IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
		UPDATE counterparty SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE counterparty SET category = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE counterparty SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    -- code
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
		UPDATE counterparty SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE counterparty SET code = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'code' THEN
	   UPDATE counterparty SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    -- name
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE counterparty SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE counterparty SET workflow_id = 3 where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
		UPDATE counterparty SET verified_by=p_verified_by where id=p_record_id; 
    END IF;
   -- address
   IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
		UPDATE counterparty SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	   UPDATE counterparty SET address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	   UPDATE counterparty SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
  -- company_registration_no
    IF p_new_workflow_id=3 AND p_column_name= 'company_registration_no' THEN
		UPDATE counterparty SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'company_registration_no' THEN
	   UPDATE counterparty SET company_registration_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'company_registration_no' THEN
	   UPDATE counterparty SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
     -- account_no
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
		UPDATE counterparty SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE counterparty SET account_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE counterparty SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
END IF;
-- counterparty_contacts update  -- Ref:SCBTD 402
IF p_table_name = 'counterparty_contacts' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE counterparty_contacts SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
			UPDATE counterparty_contacts SET status='active'  where id= p_record_id; 
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE counterparty_contacts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    -- category
    IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
		UPDATE counterparty_contacts SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE counterparty_contacts SET category = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'category' THEN
	   UPDATE counterparty_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	-- counterparty_id
	IF p_new_workflow_id=3 AND p_column_name= 'counterparty_id' THEN
		UPDATE counterparty_contacts SET workflow_id = 3 where id=p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'counterparty_id' THEN
	   UPDATE counterparty_contacts SET counterparty_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'counterparty_id' THEN
	   UPDATE counterparty_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- name
	IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
		UPDATE counterparty_contacts SET workflow_id = 3 where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE counterparty_contacts SET contact_person = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE counterparty_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
  
    -- address
	IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
		UPDATE counterparty_contacts SET workflow_id = 3 where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE counterparty_contacts SET contact_no = lv_current_value where id= p_record_id; 
    END IF;   
     IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE counterparty_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;  
    -- email_address
	IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
		UPDATE counterparty_contacts SET workflow_id = 3 where id=p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE counterparty_contacts SET email_address = lv_current_value where id= p_record_id; 
    END IF;    
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE counterparty_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF; 
END IF;
IF p_table_name = 'auditor_contacts' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE auditor_contacts SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE auditor_contacts SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE auditor_contacts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finanance_auditor_id' THEN
	   UPDATE auditor_contacts SET workflow_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finanance_auditor_id' THEN
	   UPDATE auditor_contacts SET finanance_auditor_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finanance_auditor_id' THEN
	   UPDATE auditor_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE auditor_contacts SET workflow_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE auditor_contacts SET contact_person = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE auditor_contacts SET verified_by=p_verified_by where id= p_record_id;
	END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE auditor_contacts SET workflow_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE auditor_contacts SET  contact_no = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE auditor_contacts SET  verified_by=p_verified_by where id= p_record_id;
	END IF;
	IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE auditor_contacts SET workflow_id = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE auditor_contacts SET email_address = lv_current_value where id= p_record_id;
	END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE auditor_contacts SET verified_by=p_verified_by where id= p_record_id;
	END IF;
END IF;
--  bank_departments update -- Ref: SCBTD 402 
IF p_table_name = 'bank_departments' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE bank_departments SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE bank_departments SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE bank_departments SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    -- bank_id ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'bank_id' THEN
	   UPDATE bank_departments SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_id' THEN
	   UPDATE bank_departments SET bank_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_id' THEN
	   UPDATE bank_departments SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     -- name ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE bank_departments SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE bank_departments SET name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'name' THEN
	   UPDATE bank_departments SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     -- address ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	   UPDATE bank_departments SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	   UPDATE bank_departments SET address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'address' THEN
	   UPDATE bank_departments SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
END IF;
IF p_table_name = 'bank_deparment_contacts' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE bank_deparment_contacts SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE bank_deparment_contacts SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE bank_deparment_contacts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    -- bank_department_id ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'bank_department_id' THEN
	   UPDATE bank_deparment_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_department_id' THEN
	   UPDATE bank_deparment_contacts SET bank_department_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_department_id' THEN
	   UPDATE bank_deparment_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     -- deparment_contact_person ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'deparment_contact_person' THEN
	   UPDATE bank_deparment_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'deparment_contact_person' THEN
	   UPDATE bank_deparment_contacts SET deparment_contact_person = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'deparment_contact_person' THEN
	   UPDATE bank_deparment_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- contact_no ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE bank_deparment_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE bank_deparment_contacts SET contact_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE bank_deparment_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- email_address ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE bank_deparment_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE bank_deparment_contacts SET email_address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE bank_deparment_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
END IF;
--  fund_bank_accounts update
IF p_table_name = 'fund_bank_accounts' THEN
	SELECT fund_id INTO lv_fund_id FROM fund_classes WHERE id=p_record_id;
    SELECT id INTO lv_funds_id FROM funds WHERE id=lv_fund_id;
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE fund_bank_accounts SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE fund_bank_accounts SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET workflow_id=2 where id= lv_funds_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET status='active' where id= lv_funds_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; -- p_record_id;
		END IF;
        
        /*
        IF p_new_workflow_id=3 THEN
		   UPDATE fund_bank_accounts SET workflow_id=3 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=3 THEN
		   UPDATE fund_bank_accounts SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=3 THEN
		   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
        IF p_new_workflow_id=3 THEN
		   UPDATE funds SET workflow_id=3 where id= lv_funds_id; -- p_record_id;
		END IF;
        IF p_new_workflow_id=3 THEN
		   UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; -- p_record_id;
		END IF;
        */
     END IF;
    -- fund_id ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_bank_accounts SET fund_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fund_id' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
    -- bank_branch_id ----------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE fund_bank_accounts SET bank_branch_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'bank_branch_id' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
    -- currency_id ----------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_bank_accounts SET currency_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'currency_id' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
    -- account_name ----------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'account_name' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_name' THEN
	   UPDATE fund_bank_accounts SET account_name = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_name' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'account_name' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_name' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
    -- account_no ----------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE fund_bank_accounts SET account_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'account_no' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
     -- balance_amount ----------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'balance_amount' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'balance_amount' THEN
	   UPDATE fund_bank_accounts SET balance_amount = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'balance_amount' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'balance_amount' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'balance_amount' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
     -- effectivity_date ----------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'effectivity_date' THEN
	   UPDATE fund_bank_accounts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'effectivity_date' THEN
	   UPDATE fund_bank_accounts SET effectivity_date = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'effectivity_date' THEN
	   UPDATE fund_bank_accounts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    
    IF p_new_workflow_id=3 AND p_column_name= 'effectivity_date' THEN
       UPDATE funds SET workflow_id = p_new_workflow_id where id= lv_funds_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'effectivity_date' THEN
       UPDATE funds SET verified_by=p_verified_by where id= lv_funds_id; 
    END IF;
    
 END IF;
 --  tax_agent_contacts update
IF p_table_name = 'tax_agent_contacts' THEN
	IF lvv_count_workflow_id = lvv_cnt_approved THEN   -- hadle all approved
		IF p_new_workflow_id=2 THEN
		   UPDATE tax_agent_contacts SET workflow_id=2 where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE tax_agent_contacts SET status='active' where id= p_record_id;
		END IF;
        IF p_new_workflow_id=2 THEN
		   UPDATE tax_agent_contacts SET verified_by=p_verified_by where id= p_record_id;
		END IF;
    END IF;
    -- fund_id ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'finance_tax_agent_id' THEN
	   UPDATE tax_agent_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finance_tax_agent_id' THEN
	   UPDATE tax_agent_contacts SET finance_tax_agent_id = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'finance_tax_agent_id' THEN
	   UPDATE tax_agent_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
     -- contact_person ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE tax_agent_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE tax_agent_contacts SET contact_person = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_person' THEN
	   UPDATE tax_agent_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- contact_no ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE tax_agent_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE tax_agent_contacts SET contact_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'contact_no' THEN
	   UPDATE tax_agent_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- fax_no ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'fax_no' THEN
	   UPDATE tax_agent_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fax_no' THEN
	   UPDATE tax_agent_contacts SET fax_no = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'fax_no' THEN
	   UPDATE tax_agent_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;
    -- email_address ----------------------------------------------------------------
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE tax_agent_contacts SET workflow_id = 3 where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE tax_agent_contacts SET email_address = lv_current_value where id= p_record_id; 
    END IF;
    IF p_new_workflow_id=3 AND p_column_name= 'email_address' THEN
	   UPDATE tax_agent_contacts SET verified_by=p_verified_by where id= p_record_id; 
    END IF;

END IF;

END