



CREATE VIEW [asr_app].[v_residential_account_valuation]
AS
SELECT  av.[account_no]
      ,ac.account_type
      ,av.[valuation_class_code]
      ,av.[actual_value]
      ,av.[assessed_value]
      ,av.[net_acres]
      ,av.[new_growth_flag]
      ,av.[valuation_class_code_description]
      ,av.[create_datetime]
      ,av.[create_user_id]
      ,av.[update_datetime]
      ,av.[update_user_id]
      ,av.[rowhash]
  FROM [assessor_app].[asr_app].[account_valuation] av
  LEFT JOIN [asr_app].[account] ac ON av.account_no = ac.account_no
  WHERE LEFT(av.account_no,1) = 'R'





