
      CALL FUNCTION 'BAPI_BUPA_CREATE_FROM_DATA'
        EXPORTING
          businesspartnerextern = lv_bpartnerextn     "BP CODE.
          partnercategory       = '1'                 "개인
          partnergroup          = 'ZD00'              "TM 운전자 (depending on the IMG)
          centraldata           = ls_central          "Central.
          centraldataperson     = ls_central_person   "
          addressdata           = ls_address
        IMPORTING
          businesspartner       = lv_bpartner
        TABLES
          telefondata           = lt_telfondata
          return                = lt_return.

      CALL FUNCTION 'BAPI_BUPA_ROLE_ADD_2'
        EXPORTING
          businesspartner             = lv_bpartner
          businesspartnerrolecategory = 'TM0001'
          businesspartnerrole         = 'TM0001'
        TABLES
          return                      = lt_return.
        
      CALL FUNCTION '/SCMB/PRR_UPD' " 운전자 탭
        EXPORTING
          iv_no_change_log          = abap_false
          iv_force_write_change_log = abap_false
          iv_tcode                  = sy-tcode
          it_prr                    = lt_prr
          it_prrloc                 = lt_prrloc
          it_prrprocs               = lt_prrprocs.
