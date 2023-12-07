- dashboard: performance_speed_comparison_for_the_releasechangeissue
  title: "[Performance] Speed comparison for the release/change/issue"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to evaluate the release/change/issue impact from query performance perspective'
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
    sorts: [runtime_of_the_query, period desc, history.real_dash_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: if(is_null(pivot_offset(${running_total_before},7)) = yes, pivot_offset(${running_total_before},5),
        pivot_offset(${running_total_before},7))
      label: Total Before
      value_format:
      value_format_name: Default formatting
      _kind_hint: measure
      table_calculation: total_before
      _type_hint: number
    - category: table_calculation
      expression: if(is_null(pivot_offset(${running_total_after},8)) = yes, pivot_offset(${running_total_after},4),
        pivot_offset(${running_total_after},8))
      label: 'Total After '
      value_format:
      value_format_name: Default formatting
      _kind_hint: measure
      table_calculation: total_after
      _type_hint: number
    - category: table_calculation
      expression: (${history.count} / sum(pivot_row(if(substring(${period},1,6)="before",${history.count},0))))
      label: Percent of row before
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percent_of_row_before
      _type_hint: number
    - category: table_calculation
      expression: sum(pivot_offset_list(if(substring(${period},1,6)="before",${history.count},0),-1*pivot_column()+1,pivot_column()))
        / sum(pivot_row(if(substring(${period},1,6)="before",${history.count},0)))
      label: Running Percent before
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: running_percent_before
      _type_hint: number
    - category: table_calculation
      expression: (${history.count} / sum(pivot_row(if(substring(${period},1,5)="after",${history.count},0))))
      label: Percent of row after
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percent_of_row_after
      _type_hint: number
    - category: table_calculation
      expression: sum(pivot_offset_list(if(substring(${period},1,5)="after",${history.count},0),-1*pivot_column()+1,pivot_column()))
        / sum(pivot_row(if(substring(${period},1,5)="after",${history.count},0)))
      label: Running Percent after
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: running_percent_after
      _type_hint: number
    - category: table_calculation
      expression: sum(pivot_offset_list(if(substring(${period},1,6)="before",${history.count},0),-1*pivot_column()+1,pivot_column()))
      label: Running total before
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: running_total_before
      _type_hint: number
    - category: table_calculation
      expression: sum(pivot_offset_list(if(substring(${period},1,5)="after",${history.count},0),-1*pivot_column()+1,pivot_column()))
      label: Running total after
      value_format:
      value_format_name: Default formatting
      _kind_hint: measure
      table_calculation: running_total_after
      _type_hint: number
    - category: table_calculation
      expression: "(${percent_of_row_after} - pivot_offset(${percent_of_row_before},\
        \ -1))*100"
      label: Percent change for current bucket
      value_format: 0.# pp
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: percent_change_for_current_bucket
      _type_hint: number
    - category: table_calculation
      expression: "(${running_percent_after}-${running_percent_before})*100"
      label: Percent running change
      value_format: 0.# pp
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: percent_running_change
      _type_hint: number
    - category: dimension
      expression: |-
        case(
          when(${history.runtime}<=10,"below 10s"),
          when(${history.runtime}<=15,"below 15s"),
          when(${history.runtime}<=30,"below 30s"),
          when(if(is_null(${history.runtime}),1,0)=1," Totals"),
          "more 30s")
      label: Runtime of the query
      value_format:
      value_format_name:
      dimension: runtime_of_the_query
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        case(when(if(is_null(${history.runtime}),1,0)=1,""),
          when(${history.completed_date} < ${release_time}, concat("before ","[Release Date]")),
          when(${history.completed_date} > ${release_time}, concat("after ","[Release Date]")),
          "undefined"
        )
      label: Period
      value_format:
      value_format_name:
      dimension: period
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: add_days(-7,now())
      label: Release Time
      value_format:
      value_format_name:
      dimension: release_time
      _kind_hint: dimension
      _type_hint: date
    - category: dimension
      expression: "${history.completed_date} = date(extract_years(${release_time}),extract_months(${release_time}),extract_days(${release_time}))"
      label: Include Release Date (Yes/No)
      value_format:
      value_format_name:
      dimension: include_release_date_yesno
      _kind_hint: dimension
      _type_hint: yesno
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
      under 10 sec|FIELD|before_percent_of_row_before: 82
      under 10 sec|FIELD|after_percent_change_from_previous_column_of_percent_of_row_after: 77
      under 15 sec|FIELD|after_percent_change_from_previous_column_of_percent_of_row_after: 75
      under 20 sec|FIELD|after_percent_change_from_previous_column_of_percent_of_row_after: 79
      under 10 sec|FIELD|before_running_percent_before: 97
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
      Explore: query.view
      Date Range: history.completed_date
      Dashboard: history.real_dash_id
    row: 6
    col: 0
    width: 24
    height: 7
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"How to use:","bold":true}],"id":1701902185463},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard is designed to compare Looker History statistics before and after
      the release/change/issue"}],"id":1680749533581}],"id":1680749551915},{"type":"li","children":[{"type":"lic","children":[{"text":"⚠️  release
      time is set to 7 days prior to current date. If it needs to be hardcoded to
      some specific date then It needs to modify the tile by using \"explore from
      here\" feature and adjust "},{"text":"release time","color":"hsl(218, 67%, 43%)","underline":true},{"text":"
      custom dimension."}],"id":1701902307866}],"id":1701902307866},{"type":"li","children":[{"type":"lic","id":1701902529999,"children":[{"text":"Included
      filters: Date Range(14 days by default), Dashboard and Explore"}]}],"id":1701902530000},{"type":"li","children":[{"type":"lic","children":[{"text":"Measures,
      presented on tile:"}],"id":1701902618366},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Totals
      - total number of queries before/after release time"}],"id":1701902642717}],"id":1701902642717},{"type":"li","children":[{"type":"lic","children":[{"text":"below
      Xs - queries, which runtime is less than X seconds"}],"id":1701902671930},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"“#”
      - number of queries"}],"id":1701902781960}],"id":1701902781960},{"type":"li","children":[{"type":"lic","children":[{"text":"%
      from total - shows percent of below Xs against Totals"}],"id":1701902799876}],"id":1701902799876},{"type":"li","children":[{"type":"lic","children":[{"text":"%
      total - cumulative % from total per bucket"}],"id":1701902958035}],"id":1701902958035},{"type":"li","children":[{"type":"lic","children":[{"text":"%
      Diff from - difference between before and after within below Xs bucket"}],"id":1701903044136}],"id":1701903044136},{"type":"li","children":[{"type":"lic","children":[{"text":"%
      Diff total - cumulative difference between before and after within below Xs
      bucket"}],"id":1701903084400}],"id":1701903084400}],"id":1701902784012}],"id":1701902671930}],"id":1701902643123}],"id":1701902618366},{"type":"li","children":[{"type":"lic","children":[{"text":"It''s
      possible to sort table by any column"}],"id":1701903013778}],"id":1701903013778}],"id":1701902185463}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 6
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 14 day
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
  - name: Dashboard
    title: Dashboard
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
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: query.view
