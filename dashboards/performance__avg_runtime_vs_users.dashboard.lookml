- dashboard: performance__avg_runtime_vs_users
  title: Performance - Avg Runtime vs Users
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to correlate number of users with queries average runtime'
  filters_bar_collapsed: true
  elements:
  - title: Performance - Avg Runtime vs Users
    name: Performance - Avg Runtime vs Users
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.completed_date, history.average_runtime, user.count]
    fill_fields: [history.completed_date]
    filters: {}
    sorts: [history.completed_date desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, valueFormat: '0.0', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: user.count, id: user.count, name: Users Count}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      history.average_runtime: area
    series_labels:
      user.count: Users Count
    hidden_pivots: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Result Source: history.result_source
      Completed Date: history.completed_date
      Dashboard ID (Inclusive): history.real_dash_id
      Status: history.status
      Model: query.model
      Name: user.name
      Is Disabled (Yes / No): user.is_disabled
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Status
    title: Status
    type: field_filter
    default_value: complete
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.status
  - name: Completed Date
    title: Completed Date
    type: field_filter
    default_value: 7 days ago for 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.completed_date
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
  - name: Model
    title: Model
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
    field: query.model
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
  - name: Name
    title: Name
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
    field: user.name
  - name: Is Disabled (Yes / No)
    title: Is Disabled (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: system__activity
    explore: history
    listens_to_filters: []
    field: user.is_disabled
