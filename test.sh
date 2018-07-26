#!/bin/bash
python /tmp/prepare_flood_events_table.py 
python /tmp/make_dly_obs_table_standalone.py
python /tmp/by_event_for_model.py
#Rscript /tmp/install.r
Rscript /tmp/model_flood_counts_rf_ps_cln.r
python /tmp/plot_count_model_results.py out
