REPORT zmaterial_movement.

TABLES: mkpf, mseg.

SELECT-OPTIONS:
  s_mblnr FOR mkpf-mblnr,
  s_budat FOR mkpf-budat,
  s_matnr FOR mseg-matnr,
  s_bwart FOR mseg-bwart.

TYPES: BEGIN OF ty_movement,
         mblnr TYPE mkpf-mblnr,
         mjahr TYPE mkpf-mjahr,
         bldat TYPE mkpf-bldat,
         budat TYPE mkpf-budat,
         matnr TYPE mseg-matnr,
         werks TYPE mseg-werks,
         lgort TYPE mseg-lgort,
         bwart TYPE mseg-bwart,
         menge TYPE mseg-menge,
       END OF ty_movement.

DATA: gt_movement TYPE TABLE OF ty_movement.

START-OF-SELECTION.

  SELECT a~mblnr,
         a~mjahr,
         a~bldat,
         a~budat,
         b~matnr,
         b~werks,
         b~lgort,
         b~bwart,
         b~menge
    FROM mkpf AS a
    INNER JOIN mseg AS b
      ON a~mblnr = b~mblnr
     AND a~mjahr = b~mjahr
    INTO TABLE @gt_movement
    WHERE a~mblnr IN @s_mblnr
      AND a~budat IN @s_budat
      AND b~matnr IN @s_matnr
      AND b~bwart IN @s_bwart.

  IF gt_movement IS NOT INITIAL.

    TRY.

        cl_salv_table=>factory(
          IMPORTING
            r_salv_table = DATA(lo_alv)
          CHANGING
            t_table      = gt_movement ).

        lo_alv->get_functions( )->set_all( abap_true ).

        lo_alv->get_columns( )->set_optimize( abap_true ).

        lo_alv->get_columns( )->get_column( 'MBLNR' )->set_medium_text( 'Material Doc.' ).
        lo_alv->get_columns( )->get_column( 'MJAHR' )->set_medium_text( 'Document Year' ).
        lo_alv->get_columns( )->get_column( 'BLDAT' )->set_medium_text( 'Document Date' ).
        lo_alv->get_columns( )->get_column( 'BUDAT' )->set_medium_text( 'Posting Date' ).
        lo_alv->get_columns( )->get_column( 'MATNR' )->set_medium_text( 'Material' ).
        lo_alv->get_columns( )->get_column( 'WERKS' )->set_medium_text( 'Plant' ).
        lo_alv->get_columns( )->get_column( 'LGORT' )->set_medium_text( 'Storage Loc.' ).
        lo_alv->get_columns( )->get_column( 'BWART' )->set_medium_text( 'Movement Type' ).
        lo_alv->get_columns( )->get_column( 'MENGE' )->set_medium_text( 'Quantity' ).

        lo_alv->display( ).

      CATCH cx_salv_not_found INTO DATA(lx_not_found).

        MESSAGE lx_not_found->get_text( ) TYPE 'I'.

      CATCH cx_salv_msg INTO DATA(lx_salv_msg).

        MESSAGE lx_salv_msg->get_text( ) TYPE 'I'.

    ENDTRY.

  ELSE.

    MESSAGE 'No records found for the given selection.' TYPE 'I'.

  ENDIF.
