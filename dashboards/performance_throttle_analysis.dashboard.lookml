- dashboard: performance_throttle_analysis
  title: "[Performance] Throttle Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to analyse average queued time by users and possible throttles(time,
    which user wait for connection) and connection held time'
  query_timezone: user_timezone
  elements:
  - title: "[Performance] Throttle Analysis"
    name: "[Performance] Throttle Analysis"
    model: system__activity
    explore: query_metrics
    type: looker_column
    fields: [history.average_runtime, query_metrics.per_user_throttler_average, query_metrics.queued_average,
      query_metrics.async_processing_average, query_metrics.connection_held_average,
      five_mins_bin]
    sorts: [five_mins_bin]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: concat(extract_years(${history.created_time}),"-",case(when(extract_months(${history.created_time})<10,"0"),""),extract_months(${history.created_time}),"-",case(when(extract_days(${history.created_time})<10,"0"),""),extract_days(${history.created_time}),"
        ",case(when(extract_hours(${history.created_time})<10,"0"),""),extract_hours(${history.created_time}),":",case(when(extract_minutes(${history.created_time})<5,"00"),when(extract_minutes(${history.created_time})<10,"05"),when(extract_minutes(${history.created_time})<15,"10"),when(extract_minutes(${history.created_time})<20,"15"),when(extract_minutes(${history.created_time})<25,"20"),when(extract_minutes(${history.created_time})<30,"25"),when(extract_minutes(${history.created_time})<30,"30"),when(extract_minutes(${history.created_time})<40,"35"),when(extract_minutes(${history.created_time})<45,"40"),when(extract_minutes(${history.created_time})<50,"45"),when(extract_minutes(${history.created_time})<55,"50"),"55"))
      label: five mins bin
      value_format:
      value_format_name:
      dimension: five_mins_bin
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
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
    stacking: normal
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
    show_silhouette: true
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_types:
      history.average_runtime: scatter
    series_colors:
      query_metrics.per_user_throttler_average: "#952D98"
      query_metrics.queued_average: "#EA4335"
    trend_lines: []
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [query_metrics.async_processing_average, history.average_runtime]
    title_hidden: true
    listen:
      Created Date: history.created_date
      Created Hour of Day: history.created_hour_of_day
    row: 3
    col: 0
    width: 24
    height: 12
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"How to use:","bold":true}],"id":1701967775221},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard is designed to showcase average queued time by users and possible
      throttles (time, which user wait for connection)"}],"id":1680749533581}],"id":1680749551915},{"type":"li","children":[{"type":"lic","children":[{"text":"Filters:
      Created Date (by default - 7 days) and Created Hour of Day. There is ability
      to adjust time, filter by interested hours within the day"}],"id":1701967909120}],"id":1701967909120},{"type":"li","children":[{"type":"lic","id":1701967897773,"children":[{"text":"Bar
      chart shows 3 measures within 5 minute intervals and should be equal to db connection
      timeout:"}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Per
      User Throttler Average - time, which user wait for connection"}],"id":1701968050358}],"id":1701968050358},{"type":"li","children":[{"type":"lic","children":[{"text":"Queued
      average time - time in queue for the user"}],"id":1701968090445}],"id":1701968090445},{"type":"li","children":[{"type":"lic","children":[{"text":"Connection
      held time - time, which query takes including database time. Helps to identify
      delays on Looker Query Generation process."}],"id":1701968134201}],"id":1701968134201}],"id":1701968050828}],"id":1701967897774}],"id":1701967775222}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 3
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_date
  - name: Created Hour of Day
    title: Created Hour of Day
    type: field_filter
    default_value: "[0,23]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 23
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_hour_of_day
