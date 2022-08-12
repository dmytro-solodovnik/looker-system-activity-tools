- dashboard: dashboard_performance
  title: Dashboard Performance
  layout: newspaper
  preferred_viewer: dashboards-next
  query_timezone: user_timezone
  elements:
  - title: Cache vs Query
    name: Cache vs Query
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.total_runtime, history.created_minute, history.count, user.count,
      result_source_groups]
    pivots: [result_source_groups]
    filters: {}
    sorts: [history.created_minute, result_source_groups]
    limit: 5000
    dynamic_fields: [{category: dimension, description: '', label: Result Source Groups,
        value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: result_source_groups, args: [history.result_source, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Cache, filter: 'cache,NULL'}], Query], _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: UTC
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
    hidden_series: [history.count, user.count]
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [history.total_runtime, user.count]
    listen:
      Created Date: history.created_date
      Created Hour of Day: history.created_hour_of_day
      LookML Dashboard: history.real_dash_id
      Slug: history.slug
      Result Source: history.result_source
    row: 10
    col: 0
    width: 24
    height: 5
  - title: Queries Executed
    name: Queries Executed
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.id, history.slug, history.created_minute, history.result_source,
      user.name, history.total_runtime, query.id, history.real_dash_id]
    sorts: [history.total_runtime desc]
    limit: 500
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: history.total_runtime,
            id: history.total_runtime, name: Total Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.count,
            id: history.count, name: History}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: user.count, id: user.count,
            name: User}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [history.count, user.count]
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Date: history.created_date
      Created Hour of Day: history.created_hour_of_day
      LookML Dashboard: history.real_dash_id
      Slug: history.slug
      Result Source: history.result_source
    row: 15
    col: 0
    width: 24
    height: 7
  - title: Total Queries Count
    name: Total Queries Count
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.total_runtime, history.created_minute, history.count, user.count]
    sorts: [history.created_minute]
    limit: 5000
    dynamic_fields: [{category: dimension, description: '', label: Result Source Groups,
        value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: result_source_groups, args: [history.result_source, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Cache, filter: 'cache,NULL'}], Query], _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: UTC
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
    y_axes: [{label: '', orientation: left, series: [{axisId: history.total_runtime,
            id: history.total_runtime, name: Total Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.count,
            id: history.count, name: History}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: user.count, id: user.count,
            name: User}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [history.count, user.count]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [history.total_runtime, user.count]
    listen:
      Created Date: history.created_date
      Created Hour of Day: history.created_hour_of_day
      LookML Dashboard: history.real_dash_id
      Slug: history.slug
      Result Source: history.result_source
    row: 5
    col: 0
    width: 24
    height: 5
  - title: Dashboards Statistic
    name: Dashboards Statistic
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.real_dash_id, history.result_source, user.count, history.count,
      history.average_runtime]
    pivots: [history.result_source]
    filters: {}
    sorts: [history.real_dash_id desc, history.result_source desc]
    limit: 5000
    total: true
    dynamic_fields: [{category: dimension, description: '', label: Result Source Groups,
        value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: result_source_groups, args: [history.result_source, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Cache, filter: 'cache,NULL'}], Query], _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: UTC
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
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
          palette_id: 15408e14-414f-57a1-ab33-5bfeadfc6e8f
          collection_id: dv-palette
          custom_colors:
          - "#23992e"
          - "#ffea89"
          - "#b25e7e"
        value_display: true
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
    stacking: percent
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
    y_axes: [{label: '', orientation: left, series: [{axisId: history.total_runtime,
            id: history.total_runtime, name: Total Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.count,
            id: history.count, name: History}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: user.count, id: user.count,
            name: User}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [history.count, user.count]
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Created Date: history.created_date
      Created Hour of Day: history.created_hour_of_day
      LookML Dashboard: history.real_dash_id
      Slug: history.slug
      Result Source: history.result_source
    row: 0
    col: 0
    width: 24
    height: 5
  filters:
  - name: Created Date
    title: Created Date
    type: date_filter
    default_value: today
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
  - name: Created Hour of Day
    title: Created Hour of Day
    type: number_filter
    default_value: "[0, 23]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 23
  - name: LookML Dashboard
    title: LookML Dashboard
    type: string_filter
    default_value: pa^_general%,quality%
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Slug
    title: Slug
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Result Source
    title: Result Source
    type: string_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
