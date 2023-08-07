- dashboard: performance__speed_comparison_for_release
  title: Performance - Speed comparison for release
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to evaluate the release from query performance perspective'
  filters_bar_collapsed: true
  elements:
  - title: Speed comparison for release
    name: Speed comparison for release
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, query.view, history.count, runtime_of_the_query,
      period, release_time]
    pivots: [runtime_of_the_query, period]
    filters:
      history.result_source: "-NULL"
      include_release_date_yesno: 'No'
    sorts: [runtime_of_the_query, period desc, percent_change_for_current_bucket desc
        2]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'pivot_offset(${running_total_before},7)',
        label: Total Before, value_format: !!null '', value_format_name: Default formatting,
        _kind_hint: measure, table_calculation: total_before, _type_hint: number},
      {category: table_calculation, expression: 'pivot_offset(${running_total_after},8)',
        label: 'Total After ', value_format: !!null '', value_format_name: Default
          formatting, _kind_hint: measure, table_calculation: total_after, _type_hint: number},
      {category: table_calculation, expression: '(${history.count} / sum(pivot_row(if(substring(${period},1,6)="before",${history.count},0))))',
        label: Percent of row before, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percent_of_row_before, _type_hint: number},
      {category: table_calculation, expression: 'sum(pivot_offset_list(if(substring(${period},1,6)="before",${history.count},0),-1*pivot_column()+1,pivot_column()))
          / sum(pivot_row(if(substring(${period},1,6)="before",${history.count},0)))',
        label: Running Percent before, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: running_percent_before, _type_hint: number},
      {category: table_calculation, expression: '(${history.count} / sum(pivot_row(if(substring(${period},1,5)="after",${history.count},0))))',
        label: Percent of row after, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percent_of_row_after, _type_hint: number},
      {category: table_calculation, expression: 'sum(pivot_offset_list(if(substring(${period},1,5)="after",${history.count},0),-1*pivot_column()+1,pivot_column()))
          / sum(pivot_row(if(substring(${period},1,5)="after",${history.count},0)))',
        label: Running Percent after, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: running_percent_after, _type_hint: number},
      {category: table_calculation, expression: 'sum(pivot_offset_list(if(substring(${period},1,6)="before",${history.count},0),-1*pivot_column()+1,pivot_column()))',
        label: Running total before, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: running_total_before, _type_hint: number},
      {category: table_calculation, expression: 'sum(pivot_offset_list(if(substring(${period},1,5)="after",${history.count},0),-1*pivot_column()+1,pivot_column()))',
        label: Running total after, value_format: !!null '', value_format_name: Default
          formatting, _kind_hint: measure, table_calculation: running_total_after,
        _type_hint: number}, {category: table_calculation, expression: "(${percent_of_row_after}\
          \ - pivot_offset(${percent_of_row_before}, -1))*100", label: Percent change
          for current bucket, value_format: 0.# pp, value_format_name: __custom, _kind_hint: measure,
        table_calculation: percent_change_for_current_bucket, _type_hint: number},
      {category: table_calculation, expression: "(${running_percent_after}-${running_percent_before})*100",
        label: Percent running change, value_format: 0.# pp, value_format_name: __custom,
        _kind_hint: measure, table_calculation: percent_running_change, _type_hint: number},
      {category: dimension, expression: "case(\n  when(${history.runtime}<=10,\"below\
          \ 10s\"),\n  when(${history.runtime}<=15,\"below 15s\"),\n  when(${history.runtime}<=30,\"\
          below 30s\"),\n  when(if(is_null(${history.runtime}),1,0)=1,\" Totals\"\
          ),\n  \"more 30s\")", label: Runtime of the query, value_format: !!null '',
        value_format_name: !!null '', dimension: runtime_of_the_query, _kind_hint: dimension,
        _type_hint: string}, {category: dimension, expression: "case(when(if(is_null(${history.runtime}),1,0)=1,\"\
          \"),\n  when(${history.completed_date} < ${release_time}, concat(\"before\
          \ \",\"[Release Date]\")),\n  when(${history.completed_date} > ${release_time},\
          \ concat(\"after \",\"[Release Date]\")),\n  \"undefined\"\n)", label: Period,
        value_format: !!null '', value_format_name: !!null '', dimension: period,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: 'add_days(-14,now())',
        label: Release Time, value_format: !!null '', value_format_name: !!null '',
        dimension: release_time, _kind_hint: dimension, _type_hint: date}, {category: dimension,
        expression: "${history.completed_date} = date(extract_years(${release_time}),extract_months(${release_time}),extract_days(${release_time}))",
        label: Include Release Date (Yes/No), value_format: !!null '', value_format_name: !!null '',
        dimension: include_release_date_yesno, _kind_hint: dimension, _type_hint: yesno}]
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", history.real_dash_id, query.formatted_fields,
      query.filters, history.count, history.queries_under_10s, history.cache_result_query_count,
      history.average_runtime, history.max_runtime, history.min_runtime]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      history.count: "#"
      running_total_before: 'cum #'
      running_total_after: 'cum #'
      percent_of_row_before: "% from total"
      percent_of_row_after: "% from total"
      percent_change_from_previous_column_of_percent_of_row_after: "% Diff"
      history.real_dash_id: Dashboard ID
      query.view: Tile Explore
      total_before: "# Before"
      total_after: "# After"
      running_percent_before: "% total"
      running_percent_after: "% total"
      percent_change_for_current_bucket: "% Diff from"
      percent_running_change: "% Diff total"
    series_column_widths:
      history.real_dash_id: 186
      query.view: 169
      history.completed_hour: 158
      under 10 sec|FIELD|before_percent_of_row_before: 82
      under 10 sec|FIELD|after_percent_change_from_previous_column_of_percent_of_row_after: 77
      under 15 sec|FIELD|after_percent_change_from_previous_column_of_percent_of_row_after: 75
      under 20 sec|FIELD|after_percent_change_from_previous_column_of_percent_of_row_after: 79
      under 10 sec|FIELD|before_running_percent_before: 97
      release_date: 183
      release_time: 160
    series_cell_visualizations:
      history.queries_under_10s:
        is_active: false
      history.average_runtime:
        is_active: true
        palette:
          palette_id: dv-palette-diverging-0
          collection_id: dv-palette
    series_text_format:
      percent_of_row_before:
        align: center
      history.count:
        align: center
      query.view:
        align: left
        italic: true
      history.real_dash_id:
        align: left
        italic: true
      percent_of_row_after:
        align: center
      running_total_before:
        align: center
      running_total_after:
        align: center
      percent_change_from_previous_column_of_percent_of_row_after:
        align: center
      total_before:
        align: center
      total_after:
        align: center
      running_percent_before:
        align: center
      running_percent_after:
        align: center
      percent_change_for_current_bucket:
        align: center
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, custom: {
            id: 77c00e43-be38-dd33-7a4b-2967fc1e3670, label: Custom, type: continuous,
            stops: [{color: blue, offset: 0}, {color: "#FFFFFF", offset: 50}, {color: "#34B233",
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: minimum},
              mid: {type: number, value: 0}, max: {type: maximum}}, mirror: true,
            reverse: false, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [percent_running_change]}]
    theme: traditional
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    genericLabelForSubtotals: false
    transposeTable: false
    hide|query.view: false
    label|period: ''
    heading|period: ''
    hide|period: false
    subtotalDepth: '1'
    switch|history.count: false
    label|abs_cumulative: Abs cumulative
    heading|abs_cumulative: ''
    style|abs_cumulative: normal
    reportIn|abs_cumulative: '1'
    unit|abs_cumulative: ''
    comparison|abs_cumulative: no_variance
    switch|abs_cumulative: false
    var_num|abs_cumulative: false
    var_pct|abs_cumulative: false
    defaults_version: 1
    hidden_pivots:
      under 10 sec|FIELD|before:
        measure_names:
        - percent_of_row_after
        - running_total_after
        - total_before
        - total_after
        - running_percent_after
      under 10 sec|FIELD|after:
        measure_names:
        - percent_of_row_before
        - running_total_before
        - total_before
        - total_after
        - running_percent_before
      under 15 sec|FIELD|before:
        measure_names:
        - percent_of_row_after
        - running_total_after
        - total_before
        - total_after
        - running_percent_after
      under 15 sec|FIELD|after:
        measure_names:
        - percent_of_row_before
        - running_total_before
        - total_before
        - total_after
        - running_percent_before
      under 20 sec|FIELD|before:
        measure_names:
        - percent_of_row_after
        - running_total_after
        - total_before
        - total_after
        - running_percent_after
      under 20 sec|FIELD|after:
        measure_names:
        - percent_of_row_before
        - running_total_before
        - total_before
        - total_after
        - running_percent_before
      x > 20 sec|FIELD|before:
        measure_names:
        - percent_of_row_after
        - running_total_after
        - total_before
        - total_after
        - running_percent_after
      x > 20 sec|FIELD|after:
        measure_names:
        - percent_of_row_before
        - running_total_before
        - total_before
        - total_after
        - running_percent_before
      Totals|FIELD|:
        measure_names:
        - percent_of_row_before
        - percent_of_row_after
        - running_total_before
        - running_total_after
        - running_percent_after
        - running_percent_before
        - percent_change_for_current_bucket
      under 10s|FIELD|before:
        measure_names:
        - total_before
        - total_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_of_row_before
        - percent_of_row_after
      under 10s|FIELD|after:
        measure_names:
        - total_before
        - total_after
        - running_percent_before
        - percent_change_for_current_bucket
        - percent_of_row_after
        - percent_of_row_before
      under 15s|FIELD|before:
        measure_names:
        - total_before
        - total_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_of_row_after
        - percent_of_row_before
      under 15s|FIELD|after:
        measure_names:
        - total_before
        - total_after
        - running_percent_before
        - percent_change_for_current_bucket
        - percent_of_row_after
        - percent_of_row_before
      under 20s|FIELD|before:
        measure_names:
        - total_before
        - total_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_of_row_after
        - percent_of_row_before
      under 20s|FIELD|after:
        measure_names:
        - total_before
        - total_after
        - running_percent_before
        - percent_change_for_current_bucket
        - percent_of_row_after
        - percent_of_row_before
      x > 20s|FIELD|before:
        measure_names:
        - total_before
        - total_after
        - running_percent_after
        - percent_of_row_after
        - percent_change_for_current_bucket
        - running_percent_before
      x > 20s|FIELD|after:
        measure_names:
        - total_before
        - total_after
        - running_percent_before
        - percent_of_row_before
        - running_percent_after
      under 10s|FIELD|before 2023-07-25:
        measure_names:
        - total_before
        - total_after
        - percent_change_for_current_bucket
        - running_percent_after
        - percent_of_row_before
        - percent_of_row_after
      under 10s|FIELD|after 2023-07-25:
        measure_names:
        - total_before
        - total_after
        - running_percent_before
        - percent_of_row_before
        - percent_of_row_after
      " Totals|FIELD|":
        measure_names:
        - running_percent_before
        - running_percent_after
        - percent_of_row_before
        - percent_of_row_after
        - percent_change_for_current_bucket
        - history.count
        - percent_running_change
      below 10s|FIELD|before 2023-07-25:
        measure_names:
        - total_before
        - total_after
        - running_percent_after
        - percent_of_row_after
        - percent_change_for_current_bucket
      below 10s|FIELD|after 2023-07-25:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_before
        - running_percent_before
      below 15s|FIELD|before 2023-07-25:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_after
        - running_percent_after
        - percent_change_for_current_bucket
      below 15s|FIELD|after 2023-07-25:
        measure_names:
        - total_before
        - total_after
      below 10s|FIELD|before [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_running_change
      below 10s|FIELD|after [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_before
        - running_percent_before
      below 15s|FIELD|before [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_running_change
      below 15s|FIELD|after [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_before
        - running_percent_before
      below 30s|FIELD|before [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_running_change
      below 30s|FIELD|after [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_before
        - running_percent_before
      more 30s|FIELD|before [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_after
        - running_percent_after
        - percent_change_for_current_bucket
        - percent_running_change
      more 30s|FIELD|after [Release Date]:
        measure_names:
        - total_before
        - total_after
        - percent_of_row_before
        - running_percent_before
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [running_total_before, running_total_after]
    hidden_points_if_no: []
    title_hidden: true
    listen:
      Completed Date: history.completed_date
      Dashboard ID (Inclusive): history.real_dash_id
      Explore: query.view
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Completed Date
    title: Completed Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.completed_date
  - name: Dashboard ID (Inclusive)
    title: Dashboard ID (Inclusive)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.real_dash_id
  - name: Explore
    title: Explore
    type: field_filter
    default_value: history
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: query.view
