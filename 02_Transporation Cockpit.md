<a name="top"></a>

# Enhancement Spot

- [Selection Profile](#SelectionProfile)
  - [Additional Selection Profile](#AdditionalSelectionProfile)

## Selection Profile
### Additional Selection Profile
#### Class : /SCMTMS/CL_PROF_ACC  (Get Selections for Profiles)
#### Method: GET_SEL_OPT_ADD
You can determine values for the query attributes before executing the specific query.
Ex) Assume that you add a condition field in your additional selection such as
    BO_NAME = 'FU' / FIELD = 'RESP_PERSON' / LOW Value = 'SY-UNAME'
    then where condition might be (TOR_ROOT)RESP_PERSON = 'SY-UNAME so you should change this to SAP user ID who logged in.
Sample Source Code)
``` abap
    LOOP AT ct_selopt_add ASSIGNING FIELD-SYMBOL(<ls_selopt_add>).

      CASE <ls_selopt_add>-attribute_name.
        WHEN /scmtms/if_tor_c=>sc_query_attribute-stop_successor-fu_stage_data_by_attr-resp_person.
          IF <ls_selopt_add>-low = 'SY-UNAME'.
            <ls_selopt_add>-low = sy-uname.
          ENDIF.
        WHEN OTHERS.
          CONTINUE.
      ENDCASE.
    ENDLOOP.
```

### /SCMTMS/TOR
#### ROOT
##### Set initial status attributes
If you want to set initial value on (your custom) status attributes when documents are created,
enhance below.<br>
DET   : DET_ROOT_AC<br>
Class : /SCMTMS/CL_TOR_D_ROOT_AC<br>
Method: SET_INITIAL_STATUS_ATTRIBUTES

<p align="right"><a href="#top">⬆️ back to top</a></p>
