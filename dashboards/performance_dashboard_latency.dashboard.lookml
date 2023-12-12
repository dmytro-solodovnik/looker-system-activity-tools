- dashboard: performance_dashboard_latency
  title: '[Performance] Dashboard Latency'
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Dashboard Latency by Query
    name: Dashboard Latency by Query
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, query.formatted_fields, history.queries_under_10s,
      history.cache_result_query_count, history.average_runtime, history.max_runtime,
      history.min_runtime, history.count]
    filters:
      latency_bins: ''
    sorts: [history.count desc]
    limit: 500
    dynamic_fields:
    - category: dimension
      description: ''
      label: Latency Bins
      value_format:
      value_format_name:
      calculation_type: bin
      dimension: latency_bins
      args:
      - history.runtime
      - '10'
      - '0'
      - '60'
      -
      - classic
      _kind_hint: dimension
      _type_hint: string
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", history.real_dash_id, query.formatted_fields,
      history.count, history.queries_under_10s, history.cache_result_query_count,
      history.average_runtime, history.max_runtime, history.min_runtime]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      history.queries_under_10s:
        is_active: false
      history.average_runtime:
        is_active: true
        palette:
          palette_id: dv-palette-diverging-0
          collection_id: dv-palette
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Dashboard ID (Inclusive): history.real_dash_id
      Result Source: history.result_source
      Fields Used: query.formatted_fields
      Runtime in Seconds: history.runtime
      User Name: user.name
      Filters Used: query.filters
    row: 11
    col: 0
    width: 24
    height: 8
  - title: With Filters
    name: With Filters
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, query.formatted_fields, history.queries_under_10s,
      history.cache_result_query_count, history.average_runtime, history.max_runtime,
      history.min_runtime, history.count, query.filters]
    filters:
      latency_bins: ''
    sorts: [history.count desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Latency Bins
      value_format:
      value_format_name:
      calculation_type: bin
      dimension: latency_bins
      args:
      - history.runtime
      - '10'
      - '0'
      - '60'
      -
      - classic
      _kind_hint: dimension
      _type_hint: string
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", history.real_dash_id, query.formatted_fields,
      query.filters, history.count, history.queries_under_10s, history.cache_result_query_count,
      history.average_runtime, history.max_runtime, history.min_runtime]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      history.queries_under_10s:
        is_active: false
      history.average_runtime:
        is_active: true
        palette:
          palette_id: dv-palette-diverging-0
          collection_id: dv-palette
    defaults_version: 1
    listen:
      Dashboard ID (Inclusive): history.real_dash_id
      Completed Date: history.completed_date
      Result Source: history.result_source
      Fields Used: query.formatted_fields
      Runtime in Seconds: history.runtime
      User Name: user.name
      Filters Used: query.filters
    row: 19
    col: 0
    width: 24
    height: 9
  - title: Dashboard Runtime 5s Buckets
    name: Dashboard Runtime 5s Buckets
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, runtime_bucket_5_seconds, history.dashboard_run_count,
      history.query_run_count]
    pivots: [runtime_bucket_5_seconds]
    filters: {}
    sorts: [runtime_bucket_5_seconds, history.dashboard_run_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Latency Bins
      value_format:
      value_format_name:
      calculation_type: bin
      dimension: latency_bins
      args:
      - history.runtime
      - '10'
      - '0'
      - '60'
      -
      - classic
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Runtime Bucket 5 Seconds
      value_format:
      value_format_name:
      calculation_type: bin
      dimension: runtime_bucket_5_seconds
      args:
      - history.runtime
      - '5'
      - '0'
      - '20'
      -
      - classic
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      label: Query Count percent of row
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_row
      table_calculation: query_count_percent_of_row
      args:
      - history.count
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      label: Query Count running percent
      value_format:
      value_format_name: percent_0
      calculation_type: running_row_total
      table_calculation: query_count_running_percent
      args:
      - percent_of_row
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - history.dashboard_run_count
      calculation_type: percent_of_row
      category: table_calculation
      based_on: history.dashboard_run_count
      label: Percent of row
      source_field: history.dashboard_run_count
      table_calculation: percent_of_row
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      label: Running row total
      value_format:
      value_format_name: percent_0
      calculation_type: running_row_total
      table_calculation: running_row_total
      args:
      - percent_of_row
      _kind_hint: measure
      _type_hint: number
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      history.real_dash_id: left
    column_order: ["$$$_row_numbers_$$$", history.real_dash_id, 'T01 [0.0,5.0)|FIELD|1_history.dashboard_run_count',
      'T01 [0.0,5.0)|FIELD|1_running_row_total', 'T02 [5.0,10.0)|FIELD|2_history.dashboard_run_count',
      'T02 [5.0,10.0)|FIELD|2_running_row_total', 'T03 [10.0,15.0)|FIELD|3_history.dashboard_run_count',
      'T03 [10.0,15.0)|FIELD|3_running_row_total', 'T04 [15.0,20.0)|FIELD|4_history.dashboard_run_count',
      'T04 [15.0,20.0)|FIELD|4_running_row_total', 'T05 [20.0,inf)|FIELD|5_history.dashboard_run_count',
      'T05 [20.0,inf)|FIELD|5_running_row_total', TXX Undefined|FIELD|6_history.dashboard_run_count,
      TXX Undefined|FIELD|6_running_row_total]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      running_percent: cum %
      history.count: "#"
      history.dashboard_run_count: "#"
      running_row_total: cum %
      history.real_dash_id: Dashboard ID
    series_column_widths:
      history.real_dash_id: 485
    series_cell_visualizations:
      history.queries_under_10s:
        is_active: false
      history.average_runtime:
        is_active: true
        palette:
          palette_id: dv-palette-diverging-0
          collection_id: dv-palette
    conditional_formatting: [{type: less than, value: 0.3, background_color: "#c60199",
        font_color: !!null '', color_application: {collection_id: dv-palette, custom: {
            id: f151bf1f-7413-2bc2-cc4c-ea92c47bb0f8, label: Custom, type: continuous,
            stops: [{color: orange, offset: 0}, {color: orange, offset: 100}]}, options: {
            steps: 2, constraints: {mid: {type: number, value: 0.2}, min: {type: number,
                value: 0}, max: {type: number, value: 0.3}}, reverse: false, stepped: false,
            mirror: false}}, bold: false, italic: false, strikethrough: false, fields: [
          running_row_total]}, {type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, custom: {
            id: adfcfb90-294c-5a42-c8fe-7698919eeae0, label: Custom, type: continuous,
            stops: [{color: "#6e2cb4", offset: 0}, {color: "#00b2a9", offset: 50},
              {color: "#33b334", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: number, value: 0.3}, mid: {type: middle}, max: {type: maximum}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [running_row_total]}]
    defaults_version: 1
    hidden_pivots: {}
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
    hidden_fields: [percent_of_row, history.query_run_count]
    listen:
      Dashboard ID (Inclusive): history.real_dash_id
      Completed Date: history.completed_date
      Result Source: history.result_source
      Runtime in Seconds: history.runtime
      User Name: user.name
    row: 0
    col: 0
    width: 24
    height: 11
  filters:
  - name: Completed Date
    title: Completed Date
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
  - name: Dashboard ID (Inclusive)
    title: Dashboard ID (Inclusive)
    type: field_filter
    default_value: pa^_general::%,quality::%,meta::%,netflix::%,pinterest::%,snap::%,tiktok::%,twitter::%,youtube::%,reddit::%
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.real_dash_id
  - name: Result Source
    title: Result Source
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.result_source
  - name: Fields Used
    title: Fields Used
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
    field: query.formatted_fields
  - name: Filters Used
    title: Filters Used
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: query.filters
  - name: User Name
    title: User Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: user.name
  - name: Runtime in Seconds
    title: Runtime in Seconds
    type: field_filter
    default_value: "[0,301]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 301
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.runtime
