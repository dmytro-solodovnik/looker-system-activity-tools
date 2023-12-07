- dashboard: usage_dashboards
  title: "[Usage] Dashboards"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: Helps to evaluate the End User Behavior
  refresh: 1 hour
  query_timezone: user_timezone
  filters_bar_collapsed: true
  elements:
  - title: Total Dashboards Run Count
    name: Total Dashboards Run Count
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
    limit: 500
    column_limit: 50
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    hidden_fields: []
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 6
    col: 0
    width: 6
    height: 2
  - title: Total Users
    name: Total Users
    model: system__activity
    explore: user
    type: single_value
    fields: [user.count]
    filters:
      user.is_disabled: 'No'
    limit: 500
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: user.count, id: user.count,
            name: User}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: history.average_runtime, id: history.average_runtime, name: Average
              Runtime in Seconds}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_colors:
      user.count: "#079C98"
      history.average_runtime: "#B2B4B3"
    series_point_styles:
      user.count: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    note_state: collapsed
    note_display: hover
    note_text: Total named embed users with "explore" or "save content" permissions
      and not "admin" or "developer" permissions (non-disabled).
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 4
    col: 0
    width: 6
    height: 2
  - title: Usage Over Time - 30 Day
    name: Usage Over Time - 30 Day
    model: system__activity
    explore: user
    type: looker_line
    fields: [user.count, history.completed_date, history.dashboard_run_count]
    fill_fields: [history.completed_date]
    filters:
      user.is_disabled: 'No'
      history.completed_date: 30 days
    sorts: [history.completed_date desc]
    limit: 500
    column_limit: 50
    query_timezone: user_timezone
    analysis_config:
      forecasting:
      - field_name: history.dashboard_run_count
        forecast_n: 7
        forecast_interval: day
      - field_name: user.count
        forecast_n: 7
        forecast_interval: day
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
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: user.count, id: user.count,
            name: Users Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: history.dashboard_run_count, id: history.dashboard_run_count,
            name: Dashboard Run Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '17'
    series_types:
      history.dashboard_run_count: column
    series_colors:
      user.count: "#263c85"
      history.average_runtime: "#00B2A9"
      history.dashboard_run_count: "#00B2A9"
    series_labels:
      user.count: Users Count
    series_point_styles:
      user.count: diamond
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
    note_display: hover
    note_text: 7-day forecasted data points are based on past 30-day usage data, which
      are rendered in a lighter shade or by dashed lines.
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 10
    col: 0
    width: 24
    height: 8
  - title: Avg Daily Dashboards Run Per User
    name: Avg Daily Dashboards Run Per User
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count, user_facts.count, history.completed_date]
    fill_fields: [history.completed_date]
    sorts: [history.completed_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${history.dashboard_run_count}/(${user_facts.count})"
      label: Dashboards Run per User
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: dashboards_run_per_user
      _type_hint: number
    - category: measure
      expression:
      label: days in period
      value_format:
      value_format_name:
      based_on: history.completed_date
      _kind_hint: measure
      measure: days_in_period
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      expression: mean(${dashboards_run_per_user})
      label: Avg Dashboards Run per User Copy
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: avg_dashboards_run_per_user_copy
      _type_hint: number
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    hidden_fields: [user_facts.count, history.dashboard_run_count]
    hidden_pivots: {}
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 4
    col: 18
    width: 6
    height: 2
  - title: Avg Run Time, sec
    name: Avg Run Time, sec
    model: system__activity
    explore: user
    type: single_value
    fields: [history.average_runtime]
    filters:
      user.is_disabled: 'No'
    limit: 500
    query_timezone: user_timezone
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
    note_display: hover
    note_text: Total named embed users with "explore" or "save content" permissions
      and not "admin" or "developer" permissions (non-disabled).
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 8
    col: 18
    width: 6
    height: 2
  - title: Last View Date
    name: Last View Date
    model: system__activity
    explore: user
    type: single_value
    fields: [history.most_recent_query_date]
    filters:
      user.is_disabled: 'No'
      user_facts.is_embed: 'Yes'
      user_facts.external_id: "-0055d00000BQu1bAAD,-0055d00000BE4rgAAD"
      folders.is_embed: 'Yes'
    limit: 500
    column_limit: 50
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: user.count, id: user.count,
            name: Users Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: average_approximate_web_usage_in_minutes, id: average_approximate_web_usage_in_minutes,
            name: Average Approximate Web Usage in Minutes}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      user.count: "#263c85"
      history.average_runtime: "#00B2A9"
    series_labels:
      user.count: Users Count
    reference_lines: []
    trend_lines: []
    note_state: collapsed
    note_display: hover
    note_text: Total named embed users with "explore" or "save content" permissions
      and not "admin" or "developer" permissions (non-disabled).
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 8
    col: 0
    width: 6
    height: 2
  - title: Dashboards Run Count by Department
    name: Dashboards Run Count by Department
    model: system__activity
    explore: history
    type: looker_pie
    fields: [history.dashboard_run_count, department]
    filters:
      user_facts.is_embed: ''
      user_facts.external_id: ''
      group.name: "-All Users"
    sorts: [history.dashboard_run_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Department
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: department
      args:
      - group.name
      - - label: Finance
          filter: "%Developer%"
        - label: Marketing
          filter: "%Admin%"
        - label: Sales
          filter: "%Explorer%"
      - Engineering
      _kind_hint: dimension
      _type_hint: string
    query_timezone: user_timezone
    value_labels: labels
    label_type: labPer
    inner_radius: 40
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    hidden_fields: []
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 4
    col: 6
    width: 12
    height: 6
  - title: Avg Usage in Minutes per User
    name: Avg Usage in Minutes per User
    model: system__activity
    explore: user
    type: single_value
    fields: [user.count, history.completed_date, history.approximate_usage_in_minutes]
    fill_fields: [history.completed_date]
    filters:
      user.is_disabled: 'No'
    sorts: [history.completed_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${history.approximate_usage_in_minutes}/${user.count}"
      label: Average Approximate Web Usage in Minutes
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_approximate_web_usage_in_minutes
      _type_hint: number
    - category: table_calculation
      expression: mean(${average_approximate_web_usage_in_minutes})
      label: Avg Daily Usage in Minutes Per User
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: avg_daily_usage_in_minutes_per_user
      _type_hint: number
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: user.count, id: user.count,
            name: Users Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: average_approximate_web_usage_in_minutes, id: average_approximate_web_usage_in_minutes,
            name: Average Approximate Web Usage in Minutes}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      user.count: "#263c85"
      history.average_runtime: "#00B2A9"
    series_labels:
      user.count: Users Count
    series_point_styles:
      user.count: auto
      average_approximate_web_usage_in_minutes: square
    reference_lines: []
    trend_lines: []
    note_state: collapsed
    note_display: hover
    note_text: Total named embed users with "explore" or "save content" permissions
      and not "admin" or "developer" permissions (non-disabled).
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [history.approximate_usage_in_minutes, average_approximate_web_usage_in_minutes,
      user.count, history.completed_date]
    listen:
      Completed Date: history.completed_date
      Query Status: history.status
      LookML Dashboard: history.real_dash_id
      Looker User ID: user_facts.user_id
    row: 6
    col: 18
    width: 6
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Knowing how your dashboard is being
      used helps you demonstrate your impact and optimize your efforts. The usage
      metrics may show that one of your reports is used daily by a huge segment of
      the organization and it may show that a dashboard isn''t being viewed at all.
      This type of feedback is invaluable in guiding your work efforts.","color":"hsl(0,
      0%, 0%)","bold":true,"italic":true},{"text":"\n","bold":true,"italic":true}],"id":1701887202411},{"type":"p","id":1701887201303,"children":[{"text":"User
      Guide:"}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":1701885491846,"children":[{"text":"You
      can filter "},{"text":"Completed Date","italic":true,"bold":true},{"text":",
      "},{"italic":true,"bold":true,"text":"Dashboard ID"},{"text":", and"},{"italic":true,"bold":true,"text":"
      Looker User ID "},{"text":"at the top to track the usage of your dashboard(s)
      in a given period for given user(s)."}]}],"id":1701885492844},{"type":"li","children":[{"type":"lic","children":[{"text":"All
      usage data points in the dashboard are based on dashboard sessions that run
      successfully only. "}],"id":1701887774954}],"id":1701887774954},{"type":"li","children":[{"type":"lic","id":1701885498215,"children":[{"text":"Highlight:
      Under"},{"text":" ","italic":true},{"italic":true,"text":"Usage Over Time","bold":true},{"text":",
      you could find a 7-day usage forecast based on past 30-day usage data, which
      are rendered in a lighter shade or by dashed lines."}]}],"id":1701885498215}],"id":1701885492843},{"type":"p","children":[{"text":""}],"id":1701887762137}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 4
  filters:
  - name: Query Status
    title: Query Status
    type: field_filter
    default_value: complete
    allow_multiple_values: false
    required: false
    ui_config:
      type: button_toggles
      display: popover
      options:
      - complete
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.status
  - name: Completed Date
    title: Completed Date
    type: date_filter
    default_value: 7 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
  - name: LookML Dashboard
    title: LookML Dashboard
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
  - name: Looker User ID
    title: Looker User ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
        min: 0
        max: 1000
    model: system__activity
    explore: user
    listens_to_filters: []
    field: user_facts.user_id
