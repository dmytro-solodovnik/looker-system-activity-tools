- dashboard: performance_dashboards
  title: "[Performance] Dashboards"
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: "Helps to showcase performance metrics for dashboards that are embedded within company"
  query_timezone: user_timezone
  filters_bar_collapsed: true
  elements:
  - title: Dashboard Run Count and Runtimes
    name: Dashboard Run Count and Runtimes
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, history.dashboard_run_count, history.average_runtime]
    filters:
      history.slug: ''
      history.result_source: "-NULL"
    sorts: [history.dashboard_run_count desc, history.average_runtime desc]
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields:
    - category: dimension
      description: ''
      label: Result Source Groups
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: result_source_groups
      args:
      - history.result_source
      - - label: Cache
          filter: cache,NULL
          __FILE: DV_Users/dashboards/usage__statistics.dashboard.lookml
          __LINE_NUM: 34
      - Query
      _kind_hint: dimension
      _type_hint: string
    query_timezone: user_timezone
    show_view_names: false
    show_row_numbers: false
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
    color_application: undefined
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    series_labels:
      history.real_dash_id: Dashboard
      history.count: Queries
      user.count: Users
      history.dashboard_run_count: "#"
    series_cell_visualizations:
      history.total_runtime:
        is_active: false
      history.average_runtime:
        is_active: true
        palette:
          palette_id: ecdc143b-4fce-649d-4bf5-8fd1c6fca585
          collection_id: dv-palette
          custom_colors:
          - "#34B233"
          - "#FFFFFF"
          - "#952D98"
        value_display: true
      history.count:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: history.total_runtime,
            id: history.total_runtime, name: Total Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.count,
            id: history.count, name: History}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: user.count, id: user.count,
            name: User}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
    hidden_series: [history.count, user.count]
    legend_position: center
    font_size: '12'
    point_style: none
    series_colors:
      query - history.count: "#079c98"
      query - history.average_runtime: "#079c98"
      cache - user.count: "#952D98"
      cache - history.count: "#EA4335"
      cache - history.average_runtime: "#FF8168"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: []
    up_color: false
    down_color: false
    total_color: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hidden_pivots: {}
    minimum_column_width: 75
    series_column_widths:
      history.dashboard_run_count: 81
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      Dashboard(s): history.real_dash_id
      User Name: user.name
      Date Range: history.completed_date
    row: 3
    col: 0
    width: 8
    height: 11
  - title: Cache vs Query
    name: Cache vs Query
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.total_runtime, history.count, user.count, result_source_groups,
      history.most_recent_run_at_date]
    pivots: [result_source_groups]
    fill_fields: [history.most_recent_run_at_date]
    filters:
      history.slug: ''
      history.result_source: "-NULL"
      history.most_recent_run_at_date: 30 days
    sorts: [result_source_groups, history.most_recent_run_at_date desc]
    limit: 5000
    dynamic_fields:
    - category: dimension
      description: ''
      label: Result Source Groups
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: result_source_groups
      args:
      - history.result_source
      - - label: Cache
          filter: cache,NULL
          __FILE: DV_Users/dashboards/usage__statistics.dashboard.lookml
          __LINE_NUM: 177
      - Query
      _kind_hint: dimension
      _type_hint: string
    query_timezone: user_timezone
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: percent
    limit_displayed_rows: false
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
    y_axes: [{label: '', orientation: right, series: [{axisId: Cache - history.count,
            id: Cache - history.count, name: Cache}, {axisId: Query - history.count,
            id: Query - history.count, name: Query}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [history.count, user.count]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [history.total_runtime, user.count]
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      Dashboard(s): history.real_dash_id
      User Name: user.name
      Date Range: history.completed_date
    row: 9
    col: 8
    width: 16
    height: 5
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"How to use:","bold":true}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard is designed to showcase metrics for dashboards that are embeded within
      company (filter "},{"text":"Is Embed","underline":true,"color":"hsl(218, 67%,
      43%)"},{"text":" is equal to Yes)"}],"id":1680749533581}],"id":1680749551915},{"type":"li","children":[{"type":"lic","children":[{"text":"Filters
      are Date Range (by default - last 30 days), Dashboard(s) and User Name"}],"id":1701906490070}],"id":1701906490070},{"type":"li","children":[{"type":"lic","children":[{"text":"Tiles
      are Dashboard Run Count and Runtimes, Runtimes within the dates and Cache vs
      Query Analysis"}],"id":1701906572391}],"id":1701906572391},{"type":"li","children":[{"type":"lic","children":[{"text":"📝
      Important that cross filtering is enabled, so it''s possible to see specific
      dashboard just by clicking on it on the left tile"}],"id":1701906889574}],"id":1701906889574}],"id":1680749551914}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Dashboard Runtimes within the dates
    name: Dashboard Runtimes within the dates
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.average_runtime, history.real_dash_id, history.completed_hour]
    pivots: [history.real_dash_id]
    filters:
      history.slug: ''
      history.result_source: "-NULL"
      user_facts.is_embed: 'Yes'
      user_facts.is_looker_employee: 'No'
      history.average_runtime: "<=1000"
    sorts: [history.real_dash_id, history.average_runtime desc 0]
    limit: 5000
    column_limit: 50
    total: true
    query_timezone: user_timezone
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application: undefined
    x_axis_label: Datetime
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [history.count, user.count]
    hide_legend: true
    font_size: '12'
    series_colors:
      query - history.count: "#079c98"
      query - history.average_runtime: "#079c98"
      cache - user.count: "#952D98"
      cache - history.count: "#EA4335"
      cache - history.average_runtime: "#FF8168"
    series_labels:
      history.real_dash_id: Dashboard
      history.count: Queries
      user.count: Users
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: left,
        color: "#808080", value_format: 'Avg #.#', label: ''}]
    trend_lines: []
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      history.total_runtime:
        is_active: false
      history.average_runtime:
        is_active: true
        palette:
          palette_id: ecdc143b-4fce-649d-4bf5-8fd1c6fca585
          collection_id: dv-palette
          custom_colors:
          - "#34B233"
          - "#FFFFFF"
          - "#952D98"
        value_display: true
      history.count:
        is_active: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: []
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: []
    up_color: false
    down_color: false
    total_color: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hidden_pivots: {}
    listen:
      Dashboard(s): history.real_dash_id
      User Name: user.name
      Date Range: history.completed_date
    row: 3
    col: 8
    width: 16
    height: 6
  filters:
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 30 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
  - name: Dashboard(s)
    title: Dashboard(s)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: [Looker User ID]
    field: history.real_dash_id
  - name: Is Embed (Yes / No)
    title: Is Embed (Yes / No)
    type: string_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
  - name: User Name
    title: User Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: user
    listens_to_filters: []
    field: user.name
