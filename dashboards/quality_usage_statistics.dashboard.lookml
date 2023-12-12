- dashboard: quality_usage_statistics
  title: Quality Usage Statistics
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'This dashboard is designed to showcase metrics for Analytics 2.0 & Performance 2.0 Looker based dashboards that are embeded in the Pinnacle UI'
  query_timezone: user_timezone
  filters_bar_collapsed: true
  elements:
  - title: Queries - Distribution by Runtime
    name: Queries - Distribution by Runtime
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.runtime_tiers_5, history.query_run_count]
    filters:
      history.runtime_tiers_5: "-Undefined"
    sorts: [history.runtime_tiers_5]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      label: Percent of Query Runs
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_column_sum
      table_calculation: percent_of_query_runs
      args:
      - history.query_run_count
      _kind_hint: measure
      _type_hint: number
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: percent_of_query_runs,
            id: percent_of_query_runs, name: Percent of Query Runs}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 24,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    defaults_version: 1
    hidden_fields: [history.query_run_count]
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 5
    col: 8
    width: 16
    height: 6
  - title: Queries Run by User Logins
    name: Queries Run by User Logins
    model: system__activity
    explore: user
    type: looker_line
    fields: [user.count, history.completed_date, history.average_runtime, history.query_run_count_drill,
      history.approximate_usage_in_minutes]
    fill_fields: [history.completed_date]
    filters:
      user.is_disabled: 'No'
      history.status: complete
    sorts: [history.completed_date desc]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: round(${history.approximate_usage_in_minutes}/${user.count},0)
      label: Avg. Session Time
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: avg_session_time
      _type_hint: number
      is_disabled: true
    query_timezone: user_timezone
    x_axis_gridlines: true
    y_axis_gridlines: false
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: history.query_run_count_drill,
            id: history.query_run_count_drill, name: Query Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: user.count, id: user.count,
            name: Users Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      history.average_runtime: area
      user.count: area
    series_colors:
      user.count: "#00B2A9"
      history.average_runtime: "#00B2A9"
      history.query_run_count_drill: "#263c85"
    series_labels:
      user.count: Users Count
    series_point_styles:
      user.count: auto
    swap_axes: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    note_state: collapsed
    note_display: above
    note_text: Keep a pulse on General User Activity
    defaults_version: 1
    hidden_fields: [history.average_runtime, history.approximate_usage_in_minutes]
    hidden_pivots: {}
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 35
    col: 4
    width: 20
    height: 5
  - title: Top 15 Users
    name: Top 15 Users
    model: system__activity
    explore: history
    type: looker_bar
    fields: [user.name, history.query_run_count, history.dashboard_run_count, history.approximate_usage_in_minutes]
    filters:
      history.is_single_query: 'Yes'
      user_facts.is_looker_employee: 'No'
      history.status: complete
    sorts: [history.dashboard_run_count desc]
    limit: 15
    dynamic_fields:
    - table_calculation: percent_under_10s
      label: Percent Under 10s
      expression: "${history.queries_under_10s} / ${history.query_run_count}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: history.approximate_usage_in_minutes,
            id: history.approximate_usage_in_minutes, name: Minutes}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      user.name: Name
      history.approximate_usage_in_minutes: Web Usage in Minutes
      history.query_run_count: Queries
      percent_under_10s: "% Queries Under 10s"
      history.dashboard_run_count: Dashboard Run Count
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [history.query_run_count]
    note_state: collapsed
    note_display: hover
    note_text: Top 15 Users by Dashboard Runs
    defaults_version: 1
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 40
    col: 0
    width: 10
    height: 11
  - title: Avg WAU
    name: Avg WAU
    model: system__activity
    explore: history
    type: single_value
    fields: [user.count, history.completed_week]
    fill_fields: [history.completed_week]
    filters:
      user_facts.is_looker_employee: 'No'
      history.completed_date: 60 days
    sorts: [history.completed_week desc]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: mean(${user.count})
      label: Avg Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: avg_users
      _type_hint: number
    - category: table_calculation
      expression: |-
        sum( if( row() < round(max(row())/2,0), ${user.count}, 0 ) )
        / count( if( row() < round(max(row())/2,0),  ${user.count}, null ) )
      label: Curr_Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: curr_period
      _type_hint: number
    - category: table_calculation
      expression: |-
        sum( if( row() >= round(max(row())/2,0) , ${user.count}, 0 ) )
        / count( if( row() >= round(max(row())/2,0) , ${user.count}, null ) )
      label: Prev_Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: prev_period
      _type_hint: number
    - category: table_calculation
      expression: "(${curr_period}-${prev_period}) / ${prev_period}"
      label: Change%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: change
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '0'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    reference_lines: [{reference_type: line, line_value: median, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: center, color: "#B32F37", label: 'Median: {{median}}', value_format: 0.#},
      {reference_type: line, line_value: mean, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        label: 'Avg: {{mean}}', value_format: '0.0'}]
    trend_lines: []
    note_state: collapsed
    note_display: hover
    note_text: Rolling 30 Day Average
    defaults_version: 1
    hidden_fields: [user.count, avg_users, prev_period]
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 33
    col: 0
    width: 4
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"User Behavior"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":1674514052589,"align":"center"},{"type":"p","id":1679070924514,"align":"center","children":[{"text":"All
      the metrics related to general User behaviour on the platform & their related
      Sessions"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 28
    col: 0
    width: 24
    height: 2
  - title: Avg DAU
    name: Avg DAU
    model: system__activity
    explore: history
    type: single_value
    fields: [user.count, history.completed_date]
    fill_fields: [history.completed_date]
    filters:
      user_facts.is_looker_employee: 'No'
      history.completed_date: 60 days
    sorts: [history.completed_date desc]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: mean(${user.count})
      label: Avg Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: avg_users
      _type_hint: number
    - category: table_calculation
      expression: |-
        sum( if( row() < round(max(row())/2,0), ${user.count}, 0 ) )
        / count( if( row() < round(max(row())/2,0),  ${user.count}, null ) )
      label: Current_Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: current_period
      _type_hint: number
    - category: table_calculation
      expression: |-
        sum( if( row() >= round(max(row())/2,0) , ${user.count}, 0 ) )
        / count( if( row() >= round(max(row())/2,0) , ${user.count}, null ) )
      label: Prev_Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: prev_period
      _type_hint: number
    - category: table_calculation
      expression: "(${current_period}-${prev_period})/${prev_period}"
      label: Change%
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: change
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '0'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    reference_lines: [{reference_type: line, line_value: median, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: center, color: "#B32F37", label: 'Median: {{median}}', value_format: 0.#},
      {reference_type: line, line_value: mean, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        label: 'Avg: {{mean}}', value_format: '0.0'}]
    trend_lines: []
    note_state: collapsed
    note_display: hover
    note_text: Rolling 30 Day Average
    defaults_version: 1
    hidden_fields: [user.count, avg_users, prev_period]
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 30
    col: 0
    width: 4
    height: 3
  - title: MAU
    name: MAU
    model: system__activity
    explore: history
    type: single_value
    fields: [user.count, custom_periods]
    filters:
      user_facts.is_looker_employee: 'No'
      history.completed_date: 60 days
    sorts: [user.count desc 0]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: mean(${user.count})
      label: Avg Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: avg_users
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: |-
        sum( if( row() < round(max(row())/2,0), ${user.count}, 0 ) )
        / count( if( row() < round(max(row())/2,0),  ${user.count}, null ) )
      label: Curr_Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: curr_period
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: |-
        sum( if( row() >= round(max(row())/2,0) , ${user.count}, 0 ) )
        / count( if( row() >= round(max(row())/2,0) , ${user.count}, null ) )
      label: Prev_Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: prev_period
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${curr_period}-${prev_period}) / ${prev_period}"
      label: Change%
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: change
      _type_hint: number
      is_disabled: true
    - category: dimension
      description: ''
      label: Custom_Periods
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: custom_periods
      args:
      - history.completed_date
      - - label: Current_Period
          filter: 30 day
      - Previous Period
      _kind_hint: dimension
      _type_hint: string
    - args:
      - user.count
      calculation_type: percent_of_previous
      category: table_calculation
      based_on: user.count
      label: Percent of previous - User Count
      source_field: user.count
      table_calculation: percent_of_previous_user_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - percent_of_previous_user_count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: percent_of_previous_user_count
      label: Percent change from previous -  Percent of previous - User Count
      source_field: percent_of_previous_user_count
      table_calculation: percent_change_from_previous_percent_of_previous_user_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - user.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: user.count
      label: Percent change from previous - User Count
      source_field: user.count
      table_calculation: percent_change_from_previous_user_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '0'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    reference_lines: [{reference_type: line, line_value: median, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: center, color: "#B32F37", label: 'Median: {{median}}', value_format: 0.#},
      {reference_type: line, line_value: mean, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        label: 'Avg: {{mean}}', value_format: '0.0'}]
    trend_lines: []
    note_state: collapsed
    note_display: hover
    note_text: Last 30 Days
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 36
    col: 0
    width: 4
    height: 3
  - title: Top Dashboards - LZero
    name: Top Dashboards - LZero
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, user.count, history.real_dash_id, dashboard_title,
      dashboard_run_count]
    filters:
      history.status: complete
    sorts: [user.count desc]
    limit: 15
    dynamic_fields:
    - category: dimension
      expression: "\nsubstring(${history.real_dash_id},position(${history.real_dash_id},\"\
        ::\") +2 , length(${history.real_dash_id})) "
      label: Dashboard Title
      value_format:
      value_format_name:
      dimension: dashboard_title
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression:
      label: Dashboard Run Count
      value_format:
      value_format_name:
      based_on: history.dashboard_session
      _kind_hint: measure
      measure: dashboard_run_count
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      expression: "${dashboard_run_count}/${user.count}"
      label: Dashboard Run Per User
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: dashboard_run_per_user
      _type_hint: number
    - args:
      - dashboard_run_count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: dashboard_run_count
      label: Percent of  Dashboard Run Count
      source_field: dashboard_run_count
      table_calculation: percent_of_dashboard_run_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - args:
      - user.count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: user.count
      label: Percent of User Count
      source_field: user.count
      table_calculation: percent_of_user_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
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
    column_order: ["$$$_row_numbers_$$$", dashboard_title, user.count, dashboard_run_count,
      dashboard_run_per_user, history.approximate_usage_in_minutes, approx_avg_web_usage_per_user]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      user.count: User Count
      percent_of_user_count: Percent of Users
      percent_of_dashboard_run_count: Percent of Dashboard Runs
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
      user.count:
        is_active: true
        palette:
          palette_id: 0b1a8904-959f-9588-c26b-08b948170e3f
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#3EB0D5"
      dashboard_run_count_v2:
        is_active: true
      dashboard_run_count:
        is_active: true
        palette:
          palette_id: 80278d87-5713-da6b-0c7a-79b6852ef3bc
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#701699"
      history.approximate_usage_in_minutes:
        is_active: true
        palette:
          palette_id: 10a81dba-e0db-99eb-56a7-ab4d2ae77d39
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#952D98"
      dashboard_run_per_user:
        is_active: true
        palette:
          palette_id: 6733144a-7494-f4ff-f785-abc8e5d1dacd
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#27d6b2"
      approx_avg_web_usage_per_user:
        is_active: true
        palette:
          palette_id: f10853f2-1c67-20ca-bc8f-32a342f625c4
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#33d1d6"
      percent_of_dashboard_run_count:
        is_active: true
        palette:
          palette_id: dv-palette-sequential-0
          collection_id: dv-palette
      percent_of_user_count:
        is_active: true
        palette:
          palette_id: 640a9e50-233f-28f6-da08-a53a4611937e
          collection_id: dv-palette
          custom_colors:
          - "#FFFF"
          - "#df8ae0"
          - "#952D98"
    series_value_format:
      dashboard_run_per_user:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: [history.real_dash_id, history.query_run_count, dashboard_run_count,
      user.count]
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Approximate Web Usage is an approximation of the number of minutes
      that a user used the Looker platform. This is estimated from his/her query usage
      data. It is calculated in 5min chunks based on a user's query runs, and only
      when running active queries.
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 40
    col: 10
    width: 14
    height: 11
  - title: Dashboard Load Times
    name: Dashboard Load Times
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, user.count, history.count, history.average_runtime]
    filters:
      history.slug: ''
    sorts: [history.average_runtime desc]
    limit: 5000
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
          __FILE: DV_Users/dashboards/dashboard_performance.dashboard.lookml
          __LINE_NUM: 226
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
    hidden_fields: [user.count, history.count]
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
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 5
    col: 0
    width: 8
    height: 11
  - title: Avg Session Time by User Logins
    name: Avg Session Time by User Logins
    model: system__activity
    explore: user
    type: looker_line
    fields: [user.count, history.completed_date, history.average_runtime, history.query_run_count_drill,
      history.approximate_usage_in_minutes]
    fill_fields: [history.completed_date]
    filters:
      user.is_disabled: 'No'
      history.status: complete
    sorts: [history.completed_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: round(${history.approximate_usage_in_minutes}/${user.count},0)
      label: Avg. Session Time
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: avg_session_time
      _type_hint: number
    query_timezone: user_timezone
    x_axis_gridlines: true
    y_axis_gridlines: false
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: avg_session_time, id: avg_session_time,
            name: Avg. Session Time}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: user.count, id: user.count, name: Users Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_types:
      history.average_runtime: area
      user.count: area
    series_colors:
      user.count: "#00B2A9"
      history.average_runtime: "#00B2A9"
    series_labels:
      user.count: Users Count
    series_point_styles:
      user.count: auto
    swap_axes: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    note_state: collapsed
    note_display: above
    note_text: Keep a pulse on General User Activity
    defaults_version: 1
    hidden_fields: [history.average_runtime, history.approximate_usage_in_minutes,
      history.query_run_count_drill]
    listen:
      Is Embed (Yes / No): user_facts.is_embed
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 30
    col: 4
    width: 20
    height: 5
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
          __FILE: DV_Users/dashboards/dashboard_performance.dashboard.lookml
          __LINE_NUM: 21
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
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 11
    col: 8
    width: 16
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"System Performance"}],"align":"center"},{"type":"p","children":[{"text":""}],"id":1679068989735,"align":"center"},{"type":"p","id":1679070909709,"align":"center","children":[{"text":"Measuring
      System Performance by looking at Query & Dashboard metrics."}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 3
    col: 0
    width: 24
    height: 2
  - name: Common Dashboard Errors (copy)
    title: Common Dashboard Errors (copy)
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, history.message, history.issuer_source, history.count,
      history.dashboard_user]
    filters:
      history.status: error
      history.source: dashboard
      history.message: "-Access Denied"
      history.workspace_id: "-dev"
    sorts: [history.count desc]
    limit: 20
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
    truncate_column_names: true
    color_application:
      collection_id: dv-palette
      palette_id: dv-palette-categorical-0
    pinned_columns: {}
    column_order: [history.real_dash_id, history.message, history.dashboard_user]
    show_totals: true
    show_row_totals: true
    series_labels:
      history.dashboard_user: Impacted Users
      dashboard_creator.name: Creator
    series_column_widths:
      history.real_dash_id: 215
      history.message: 455
      history.dashboard_user: 136
      history.issuer_source: 215
    series_cell_visualizations:
      history.dashboard_user:
        is_active: true
        palette:
          palette_id: 359eb1cf-f9ad-77eb-4b48-370e899ccc76
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#b2354f"
    hidden_fields: [history.count, history.issuer_source]
    defaults_version: 1
    show_sql_query_menu_options: false
    truncate_header: false
    listen:
      UserName: user.name
      Date: history.created_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 22
    col: 0
    width: 14
    height: 6
  - name: Errors by Query Type (copy)
    title: Errors by Query Type (copy)
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.query_run_count, history.source, history.created_date]
    pivots: [history.source]
    fill_fields: [history.created_date]
    filters:
      history.is_single_query: 'Yes'
      history.status: error
      history.workspace_id: "-dev"
    sorts: [history.source 0, history.created_date]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Errors, orientation: bottom, series: [{axisId: alerts - history.query_run_count,
            id: alerts - history.query_run_count, name: alerts}, {axisId: api3 - history.query_run_count,
            id: api3 - history.query_run_count, name: api3}, {axisId: dashboard -
              history.query_run_count, id: dashboard - history.query_run_count, name: dashboard},
          {axisId: data-download-api - history.query_run_count, id: data-download-api
              - history.query_run_count, name: data-download-api}, {axisId: drill_modal
              - history.query_run_count, id: drill_modal - history.query_run_count,
            name: drill_modal}, {axisId: explore - history.query_run_count, id: explore
              - history.query_run_count, name: explore}, {axisId: guided_analysis
              - history.query_run_count, id: guided_analysis - history.query_run_count,
            name: guided_analysis}, {axisId: internal - history.query_run_count, id: internal
              - history.query_run_count, name: internal}, {axisId: look - history.query_run_count,
            id: look - history.query_run_count, name: look}, {axisId: merge_query
              - history.query_run_count, id: merge_query - history.query_run_count,
            name: merge_query}, {axisId: private_embed - history.query_run_count,
            id: private_embed - history.query_run_count, name: private_embed}, {axisId: scheduled_task
              - history.query_run_count, id: scheduled_task - history.query_run_count,
            name: scheduled_task}, {axisId: suggest - history.query_run_count, id: suggest
              - history.query_run_count, name: suggest}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [API 3 - history.query_run_count, Dashboard Prefetch - history.query_run_count,
      Other - history.query_run_count, Private Embed - history.query_run_count, Public
        Embed - history.query_run_count, Query - history.query_run_count, Renderer
        - history.query_run_count, SQL Runner - history.query_run_count, Suggest Filter
        - history.query_run_count]
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors: {}
    x_axis_datetime_label: ''
    defaults_version: 1
    listen:
      UserName: user.name
      Date: history.created_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 22
    col: 14
    width: 10
    height: 6
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"How to use:","bold":true}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard is designed to showcase metrics for Analytics 2.0 & Performance 2.0
      Looker based dashboards that are embeded in the Pinnacle UI."}],"id":1680749533581}],"id":1680749551915},{"type":"li","children":[{"type":"lic","children":[{"text":"All
      "},{"text":"active users/sessions","bold":true},{"text":" pertain to either
      Quality 2.0, Performance 2.0 or both depending on the "},{"text":"Dashboard(s)","bold":true,"italic":true},{"text":"
      filtered value, unless, mentioned otherwise."}],"id":1680749589024}],"id":1680749589023},{"type":"li","children":[{"type":"lic","children":[{"text":"For
      viewing only Quality 2.0 data, the filter should be set to “"},{"text":"starts
      with","bold":true},{"text":" "},{"text":"quality::","underline":true,"bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"” + “"},{"text":"does not contain","bold":true},{"text":"
      "},{"text":"quality::auth_attention","underline":true,"color":"hsl(217, 77%,
      60%)","bold":true},{"text":"” "}],"id":1680749638398}],"id":1680749638398},{"type":"li","children":[{"type":"lic","id":1680749759066,"children":[{"text":"Similary
      for viewing Performance 2.0 data it should be set to “"},{"text":"contains","bold":true},{"text":"
      "},{"text":"quality::auth_attention","underline":true,"bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"”; and to view data for both, “"},{"text":"start with","bold":true},{"text":"
      "},{"text":"quality::","underline":true,"bold":true,"color":"hsl(217, 77%, 60%)"},{"text":"”"}]}],"id":1680749759067},{"type":"li","children":[{"type":"lic","children":[{"text":"For
      viewing only Social 2.0 data, the filter should be set to “"},{"text":"starts
      with","bold":true},{"text":" "},{"text":"meta::","underline":true,"bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"” and/or other corresponding Media Garden integrations
      [\""},{"text":"pinterest::","bold":true,"color":"hsl(217, 77%, 60%)"},{"text":"\",\""},{"text":"twitter::","bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"\",\""},{"text":"netflix::","bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"\",\""},{"text":"snap::","bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"\",\""},{"text":"tiktok::","bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"\",\""},{"text":"youtube::","bold":true,"color":"hsl(217,
      77%, 60%)"},{"text":"\"]"}],"id":1698247927816}],"id":1698247927816}],"id":1680749551914}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Dashboard Load Times
    name: Dashboard Load Times (2)
    model: system__activity
    explore: history
    type: looker_area
    fields: [history.average_runtime, history.real_dash_id, history.completed_hour]
    pivots: [history.real_dash_id]
    filters:
      history.slug: ''
      user_facts.is_embed: 'Yes'
      user_facts.is_looker_employee: 'No'
      history.average_runtime: "<=1000"
    sorts: [history.real_dash_id, history.average_runtime desc 0]
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
          __FILE: DV_Users/dashboards/dashboard_performance.dashboard.lookml
          __LINE_NUM: 226
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
    y_axes: [{label: Avg. Runtime in Seconds, orientation: left, series: [{axisId: history.average_runtime,
            id: 'quality::authentic_ad_blocking_brand_suitability - history.average_runtime',
            name: 'quality::authentic_ad_blocking_brand_suitability'}, {axisId: history.average_runtime,
            id: 'quality::authentic_ad_blocking_fraud_sivt - history.average_runtime',
            name: 'quality::authentic_ad_blocking_fraud_sivt'}, {axisId: history.average_runtime,
            id: 'quality::authentic_ad_blocking_geo - history.average_runtime', name: 'quality::authentic_ad_blocking_geo'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_blocking_summary
              - history.average_runtime', name: 'quality::authentic_ad_blocking_summary'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_filtering_brand_suitability
              - history.average_runtime', name: 'quality::authentic_ad_filtering_brand_suitability'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_filtering_fraud_sivt
              - history.average_runtime', name: 'quality::authentic_ad_filtering_fraud_sivt'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_filtering_geo
              - history.average_runtime', name: 'quality::authentic_ad_filtering_geo'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_filtering_summary
              - history.average_runtime', name: 'quality::authentic_ad_filtering_summary'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_monitoring_brand_suitability
              - history.average_runtime', name: 'quality::authentic_ad_monitoring_brand_suitability'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_monitoring_fraud_sivt
              - history.average_runtime', name: 'quality::authentic_ad_monitoring_fraud_sivt'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_monitoring_geo
              - history.average_runtime', name: 'quality::authentic_ad_monitoring_geo'},
          {axisId: history.average_runtime, id: 'quality::authentic_ad_monitoring_summary
              - history.average_runtime', name: 'quality::authentic_ad_monitoring_summary'},
          {axisId: history.average_runtime, id: 'quality::benchmarks_groupm_standard
              - history.average_runtime', name: 'quality::benchmarks_groupm_standard'},
          {axisId: history.average_runtime, id: 'quality::benchmarks_iab_standard
              - history.average_runtime', name: 'quality::benchmarks_iab_standard'},
          {axisId: history.average_runtime, id: 'quality::overview_blocking - history.average_runtime',
            name: 'quality::overview_blocking'}, {axisId: history.average_runtime,
            id: 'quality::overview_filtering - history.average_runtime', name: 'quality::overview_filtering'},
          {axisId: history.average_runtime, id: 'quality::overview_monitoring - history.average_runtime',
            name: 'quality::overview_monitoring'}, {axisId: history.average_runtime,
            id: 'quality::overview_monitoring_partner - history.average_runtime',
            name: 'quality::overview_monitoring_partner'}, {axisId: history.average_runtime,
            id: 'quality::video_and_ctv - history.average_runtime', name: 'quality::video_and_ctv'},
          {axisId: history.average_runtime, id: 'quality::viewability_groupm_standard
              - history.average_runtime', name: 'quality::viewability_groupm_standard'},
          {axisId: history.average_runtime, id: 'quality::viewability_hulu_standard
              - history.average_runtime', name: 'quality::viewability_hulu_standard'},
          {axisId: history.average_runtime, id: 'quality::viewability_iab_standard
              - history.average_runtime', name: 'quality::viewability_iab_standard'},
          {axisId: history.average_runtime, id: 'quality::viewability_pmx_standard
              - history.average_runtime', name: 'quality::viewability_pmx_standard'}],
        showLabels: true, showValues: true, valueFormat: "#", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
      UserName: user.name
      Date: history.completed_date
      Dashboard(s): history.real_dash_id
      Result Source: history.result_source
    row: 16
    col: 0
    width: 24
    height: 6
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 30 day ago for 30 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Dashboard(s)
    title: Dashboard(s)
    type: field_filter
    default_value: quality::%,meta::%,netflix::%,pinterest::%,snap::%,tiktok::%,twitter::%,youtube::%,reddit::%,quality::auth^_attention%
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options:
      - 'quality::'
      - 'meta::'
      - 'netflix::'
      - 'pinterest::'
      - 'snap::'
      - 'tiktok::'
      - 'twitter::'
      - 'youtube::'
      - 'reddit::'
      - quality::auth_attention
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
  - name: UserName
    title: UserName
    type: field_filter
    default_value: "-%+portal%,-%+Portal%,-%Auditor%,-%auditor%,-%Analytics Service%"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: user
    listens_to_filters: []
    field: user.name
