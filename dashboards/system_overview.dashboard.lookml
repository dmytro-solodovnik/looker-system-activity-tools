- dashboard: system_overview
  title: '[System] Overview'
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'General tech overview about usage, performance, errors and details of the queries'
  refresh: 1 hour
  query_timezone: user_timezone
  filters_bar_collapsed: true
  elements:
  - title: Complete vs Uncomplete
    name: Complete vs Uncomplete
    model: system__activity
    explore: history
    type: looker_pie
    fields: [history.status, history.query_run_count, history.queries_under_10s, history.database_result_query_count,
      history.cache_result_query_count, history.average_runtime, history.max_runtime]
    filters:
      query.id: ''
    sorts: [history.query_run_count desc 0]
    limit: 5000
    column_limit: 50
    query_timezone: user_timezone
    value_labels: legend
    label_type: labPer
    inner_radius:
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
    size_by_field: history.query_run_count
    plot_size_by_field: true
    x_axis_zoom: true
    y_axis_zoom: true
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    hidden_fields: [history.database_result_query_count, history.cache_result_query_count,
      history.queries_under_10s, history.average_runtime, history.max_runtime]
    defaults_version: 1
    hidden_points_if_no: []
    hidden_pivots: {}
    font_size: 12
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 2
    col: 8
    width: 8
    height: 9
  - name: Queries under 10 seconds
    title: Queries under 10 seconds
    model: system__activity
    explore: history
    type: marketplace_viz_liquid_fill_gauge::liquid_fill_gauge-marketplace
    fields: [history.status, history.queries_under_10s, history.count]
    filters:
      query.id: ''
      history.status: complete
    sorts: [history.queries_under_10s desc 0]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${history.queries_under_10s}/${history.count}*100"
      label: "% under 10s"
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: under_10s
      _type_hint: number
    query_timezone: user_timezone
    hidden_fields: [history.queries_under_10s, history.count]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    showComparison: false
    minValue: 0
    maxValue: 100
    circleThickness: 0.15
    circleFillGap: 0
    circleColor: "#3569c9"
    waveHeight: 0.1
    waveCount: 1
    waveRiseTime: 4800
    waveAnimateTime: 4451
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#64518A"
    waveOffset: 0.8
    textVertPosition: 0.5
    textSize: 0.5
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_padding: 60
    target_source: second
    target_label_type: dboth
    spinner_type: spinner
    gauge_fill_type: progress
    viz_trellis_by: row
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.5
    bar_arm_length: 9
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: horizontal
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: second
    bar_target_label_type: both
    bar_target_label_font: 3
    bar_label_font_size: 3
    bar_fill_color: "#0092E5"
    bar_background_color: "#CECECE"
    bar_spinner_color: "#282828"
    bar_range_color: "#282828"
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
    size_by_field: history.query_run_count
    plot_size_by_field: true
    x_axis_zoom: true
    y_axis_zoom: true
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 2
    col: 0
    width: 8
    height: 9
  - name: Database vs Cache
    title: Database vs Cache
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.status, history.database_result_query_count, history.cache_result_query_count]
    filters:
      query.id: ''
      history.status: complete
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${history.queries_under_10s}/${history.count}*100"
      label: "% under 10s"
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: under_10s
      _type_hint: number
      is_disabled: true
    query_timezone: user_timezone
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    plot_size_by_field: true
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    size_by_field: history.query_run_count
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '48'
    series_labels: {}
    showComparison: false
    minValue: 0
    maxValue: 100
    circleThickness: 0.15
    circleFillGap: 0
    circleColor: "#3569c9"
    waveHeight: 0.1
    waveCount: 1
    waveRiseTime: 4800
    waveAnimateTime: 4451
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#64518A"
    waveOffset: 0.8
    textVertPosition: 0.5
    textSize: 0.5
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    hidden_fields: []
    hidden_points_if_no: []
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_padding: 60
    target_source: second
    target_label_type: dboth
    spinner_type: spinner
    gauge_fill_type: progress
    viz_trellis_by: row
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.5
    bar_arm_length: 9
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: horizontal
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: second
    bar_target_label_type: both
    bar_target_label_font: 3
    bar_label_font_size: 3
    bar_fill_color: "#0092E5"
    bar_background_color: "#CECECE"
    bar_spinner_color: "#282828"
    bar_range_color: "#282828"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 2
    col: 16
    width: 8
    height: 9
  - name: Dashboards speed
    title: Dashboards speed
    model: system__activity
    explore: history
    type: looker_scatter
    fields: [dashboard_view, history.query_run_count, runtime]
    pivots: [dashboard_view]
    filters:
      query.id: ''
      history.status: complete
    sorts: [runtime, dashboard_view]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      description: ''
      label: Dashboard View
      value_format:
      value_format_name:
      calculation_type: group_by
      dimension: dashboard_view
      args:
      - history.real_dash_id
      - - label: 1 Overview
          filter: "%overview%"
        - label: 2 Authentic Ad
          filter: "%authentic^_ad%"
        - label: 6 ATTN
          filter: "%auth^_attention%"
        - label: 3 Viewability
          filter: "%viewability%"
        - label: 4 BMs
          filter: "%benchmark%"
        - label: 5 Video & CTV
          filter: "%quality::video^_and^_ctv%"
      - Other Requests (API)
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      description: ''
      label: Runtime
      value_format:
      value_format_name:
      calculation_type: bin
      dimension: runtime
      args:
      - history.runtime
      -
      -
      -
      - - '0'
        - '5'
        - '15'
        - '60'
        - '120'
      - classic
      _kind_hint: dimension
      _type_hint: string
    query_timezone: user_timezone
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    size_by_field: history.query_run_count
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: ''
    series_labels: {}
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    hidden_fields: []
    hidden_points_if_no: []
    bin_type: steps
    bin_style: binned_hist
    winsorization: true
    x_axis_label_angle: 45
    x_label_separation: 51
    y_axis_label_angle: 45
    y_label_separation: 51
    num_step_x: 1000
    num_step_y: 1000
    x: history_count
    y: history_average_runtime
    heatmap_off: true
    layer_points: true
    size: ''
    heatmap_opacity: 0.5
    point_opacity: 0.5
    point_labels_x_offset: 0
    point_labels_y_offset: 0
    point_labels_angle: 0
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    showComparison: false
    minValue: 0
    maxValue: 100
    circleThickness: 0.15
    circleFillGap: 0
    circleColor: "#3569c9"
    waveHeight: 0.1
    waveCount: 1
    waveRiseTime: 4800
    waveAnimateTime: 4451
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#64518A"
    waveOffset: 0.8
    textVertPosition: 0.5
    textSize: 0.5
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    value_label_type: value
    value_label_padding: 60
    target_source: second
    target_label_type: dboth
    spinner_type: spinner
    gauge_fill_type: progress
    viz_trellis_by: row
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.5
    bar_arm_length: 9
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: horizontal
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: second
    bar_target_label_type: both
    bar_target_label_font: 3
    bar_label_font_size: 3
    bar_fill_color: "#0092E5"
    bar_background_color: "#CECECE"
    bar_spinner_color: "#282828"
    bar_range_color: "#282828"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 11
    col: 0
    width: 24
    height: 11
  - name: Details
    title: Details
    model: system__activity
    explore: history
    type: looker_grid
    fields: [user.id, user.name, user.edit_link, role.embed, history.query_run_count,
      history.average_runtime, history.max_runtime, history.queries_under_10s, history.status]
    pivots: [history.status]
    filters:
      query.id: ''
    sorts: [history.status, history.query_run_count desc 0]
    limit: 5000
    column_limit: 50
    query_timezone: user_timezone
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
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels: {}
    series_column_widths:
      user.name: 174
      role.embed: 139
      user.id: 83
    series_cell_visualizations:
      query.count:
        is_active: true
      history.query_run_count:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    series_value_format:
      user.id:
        name: id
        format_string: '0'
        label: ID
    hidden_fields:
    defaults_version: 1
    hidden_points_if_no: []
    hidden_pivots: {}
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 22
    col: 0
    width: 24
    height: 11
  - title: Total amount of dashboards run
    name: Total amount of dashboards run
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
    filters:
      query.id: ''
    limit: 5000
    column_limit: 50
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#952D98"
    value_format: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
    size_by_field: history.query_run_count
    plot_size_by_field: true
    x_axis_zoom: true
    y_axis_zoom: true
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    hidden_fields: []
    defaults_version: 1
    hidden_points_if_no: []
    hidden_pivots: {}
    font_size: 12
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 0
    col: 16
    width: 8
    height: 2
  - title: Errors (up to 150)
    name: Errors (up to 150)
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, history.real_dash_id, history.message, history.issuer_source,
      user.name, history.slug]
    filters:
      history.status: error
      history.source: ''
      history.message: ''
    sorts: [history.created_time desc]
    limit: 150
    column_limit: 50
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_sql_query_menu_options: false
    pinned_columns: {}
    column_order: ["$$$_row_numbers_$$$", history.created_time, history.real_dash_id,
      history.issuer_source, user.name, history.message, history.slug]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      history.dashboard_user: Impacted Users
      dashboard_creator.name: Creator
    series_column_widths:
      history.created_time: 143
      history.issuer_source: 76
      user.name: 147
      history.message: 711
    series_cell_visualizations:
      history.dashboard_user:
        is_active: true
    truncate_column_names: true
    hidden_fields: [count_of_errors]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 33
    col: 0
    width: 24
    height: 4
  - name: Long Runs Details (5K queries)
    title: Long Runs Details (5K queries)
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.id, user.name, history.slug, history.source, history.real_dash_id,
        history.runtime, filter_date_start, filter_date_end, history.created_time]
      filters:
        history.status: complete
        query.model: quality
        history.slug: ''
        user.name: ''
        is_long: 'Yes'
        history.created_time: 25 hour ago for 24 hour
      sorts: [history.runtime desc]
      limit: 5000
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: diff_days(to_date(${filter_date_start}), to_date(${filter_date_end}))+1
        label: Dates Selected
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dates_selected
        _type_hint: number
      - category: dimension
        expression: "${history.runtime}>=15"
        label: Is Long
        value_format:
        value_format_name:
        dimension: is_long
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: substring(${query.filters},position(${query.filters},"datetime_filter")+18,42)
        label: Date Range Selected
        value_format:
        value_format_name:
        dimension: date_range_selected
        _kind_hint: dimension
        _type_hint: string
      - category: dimension
        expression: |-
          if(position(${date_range_selected}, "\",")>0,
            replace(substring(${date_range_selected}, position(${date_range_selected}, "to")+3, 16),"/","-"),
          replace(substring(${date_range_selected}, position(${date_range_selected}, "to")+3, 19),"/","-")
          )
        label: Filter Date End
        value_format:
        value_format_name:
        dimension: filter_date_end
        _kind_hint: dimension
        _type_hint: string
      - category: dimension
        expression: replace(substring(${date_range_selected}, 0, abs(position(${date_range_selected},
          "to")-2)),"/","-")
        label: Filter Date Start
        value_format:
        value_format_name:
        dimension: filter_date_start
        _kind_hint: dimension
        _type_hint: string
      hidden_pivots: {}
      hidden_fields: [filter_date_start, filter_date_end, history.id]
      join_fields: []
    - model: system__activity
      explore: sql_text
      type: table
      fields: [history.id, history.runtime, lob_id_based, mprop_id_based, is_supplier_name_filter,
        is_no_permissions, is_additional_filters_based_on_ifnull]
      filters:
        history.status: complete
        history.connection_name: '"snowflake_dv_quality"'
        is_long: 'Yes'
        history.created_time: 25 hour ago for 24 hour
      sorts: [history.runtime desc]
      limit: 5000
      column_limit: 50
      dynamic_fields:
      - category: dimension
        expression: "${history.runtime}>=15"
        label: Is Long
        value_format:
        value_format_name:
        dimension: is_long
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text},".LOB_ID in (") > 0
        label: Lob ID Based
        value_format:
        value_format_name:
        dimension: lob_id_based
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text}, ".MEDIA_PROPERTY_INTERNAL_ID in
          (") > 0
        label: MProp ID Based
        value_format:
        value_format_name:
        dimension: mprop_id_based
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text}, "where supplier_name in (") >0
        label: Is Supplier Name filter
        value_format:
        value_format_name:
        dimension: is_supplier_name_filter
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: |-
          position(${sql_text.sql_text},"WHERE (IFNULL(") > 0
          OR
          position(
          substring(${sql_text.sql_text},position(${sql_text.sql_text}, "WHERE"), length(${sql_text.sql_text}) - position(${sql_text.sql_text}, "WHERE")), "(IFNULL(") > 0
        label: Is Additional Filters (based on ifnull)
        value_format:
        value_format_name:
        dimension: is_additional_filters_based_on_ifnull
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: NOT ${lob_id_based} AND NOT ${mprop_id_based} AND NOT ${is_supplier_name_filter}
        label: Is No Permissions
        value_format:
        value_format_name:
        dimension: is_no_permissions
        _kind_hint: dimension
        _type_hint: yesno
      query_timezone: user_timezone
      hidden_fields: [history.id]
      hidden_points_if_no:
      join_fields:
      - field_name: history.id
        source_field_name: history.id
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", history.created_time, user.name, history.slug,
      history.source, history.real_dash_id, history.runtime, needs_review, dates_selected,
      lob_id_based, mprop_id_based, is_supplier_name_filter, is_no_permissions, is_additional_filters_based_on_ifnull]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      q1_history.runtime:
        is_active: false
        value_display: true
        palette:
          palette_id: 77372dcb-c936-ac28-cec9-cce1d938b1bd
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#b22624"
    series_text_format:
      q1_history.runtime: {}
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, custom: {
            id: 880c4e28-e86f-0af0-dc72-cf78f6767b84, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: orange, offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [dates_selected]}, {type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    hidden_fields: [filter_date_end, filter_date_start, q1_history.runtime, history.id]
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures: []
      dimensions:
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: The unique numeric identifier for this event. Each event is linked
          to a query in Looker. Includes a link to this query on the Queries page.
          (Requires see_queries permission.)
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: History ID
        label_from_parameter:
        label_short: ID
        map_layer:
        name: history.id
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: ID
        measure: false
        parameter: false
        primary_key: true
        project_name: system__activity
        scope: history
        suggest_dimension: history.id
        suggest_explore: history
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=3"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: history.id
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The user's full name
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: User Name
        label_from_parameter:
        label_short: Name
        map_layer:
        name: user.name
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: user
        view_label: User
        dynamic: false
        week_start_day: monday
        original_view: user
        dimension_group:
        error:
        field_group_variant: Name
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: user
        suggest_dimension: user.name
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/user.view.lkml?line=73"
        permanent: true
        source_file: user.view.lkml
        source_file_path: system__activity/user.view.lkml
        sql: 'CONCAT(${first_name}, '' '', ${last_name}) '
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The unique string identifier for a query.
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Slug
        label_from_parameter:
        label_short: Slug
        map_layer:
        name: history.slug
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Slug
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.slug
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=598"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: history.slug
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The source of a query, such as a Look, an Explore, a scheduled_task,
          an alert, a dashboard etc.
        enumerations:
        field_group_label: Source
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Source
        label_from_parameter:
        label_short: Source
        map_layer:
        name: history.source
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Source
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.source
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=100"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "${TABLE}.SOURCE "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The unique string identifier for either a user-defined or a LookML
          dashboard
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Dashboard ID (Inclusive)
        label_from_parameter:
        label_short: Dashboard ID (Inclusive)
        map_layer:
        name: history.real_dash_id
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Dashboard ID (Inclusive)
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.real_dash_id
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=317"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: |-
          {% if _dialect._name == 'hypersql' %}
                  COALESCE(${dashboard_id}, CONVERT(${dashboard.id}, SQL_VARCHAR))
                {% elsif _dialect._name == 'bigquery_standard_sql' %}
                  COALESCE(${dashboard_id}, CAST(${dashboard.id} AS STRING))
                {% else %}
                  COALESCE(${dashboard_id}, CAST(${dashboard.id} AS CHAR(256)))
                {% endif %}
        sql_case:
        filters:
        times_used: 0
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: The number of seconds a query took to run
        enumerations:
        field_group_label: Runtime Fields
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: History Runtime in Seconds
        label_from_parameter:
        label_short: Runtime in Seconds
        map_layer:
        name: history.runtime
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.###
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Runtime in Seconds
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.runtime
        suggest_explore: history
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=13"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "{% if _dialect._name contains 'mysql' %}\n            CAST(${TABLE}.runtime\
          \ AS DECIMAL(19,4))\n          {% else %}\n            ${TABLE}.runtime\n\
          \          {% endif %} "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Filter Date Start
        label_from_parameter:
        label_short: Filter Date Start
        map_layer:
        name: filter_date_start
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: history
        suggest_dimension: filter_date_start
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Filter Date End
        label_from_parameter:
        label_short: Filter Date End
        map_layer:
        name: filter_date_end
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: history
        suggest_dimension: filter_date_end
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: When an event in 'History' was created. Each event is linked
          to a query in Looker.
        enumerations:
        field_group_label: Created Date
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Created Time
        label_from_parameter:
        label_short: Created Time
        map_layer:
        name: history.created_time
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_time
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group: history.created
        error:
        field_group_variant: Time
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.created_time
        suggest_explore: history
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: true
        time_interval:
          name: second
          count: 1
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=478"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "{% if _dialect._name contains 'mysql' %}\n            CONVERT(${TABLE}.CREATED_AT\
          \ USING utf8mb4)\n          {% else %}\n            ${TABLE}.CREATED_AT\n\
          \          {% endif %} "
        sql_case:
        filters:
        times_used: 0
      - type: number
        align: right
        measure: false
        dynamic: false
        can_pivot: false
        is_numeric: true
        name: dates_selected
        label: Dates Selected
        value_format:
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: The number of seconds a query took to run
        enumerations:
        field_group_label: Runtime Fields
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: History Runtime in Seconds
        label_from_parameter:
        label_short: Runtime in Seconds
        map_layer:
        name: q1_history.runtime
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.###
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Runtime in Seconds
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.runtime
        suggest_explore: sql_text
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=13"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "{% if _dialect._name contains 'mysql' %}\n            CAST(${TABLE}.runtime\
          \ AS DECIMAL(19,4))\n          {% else %}\n            ${TABLE}.runtime\n\
          \          {% endif %} "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Lob ID Based (Yes / No)
        label_from_parameter:
        label_short: Lob ID Based (Yes / No)
        map_layer:
        name: lob_id_based
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: lob_id_based
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: MProp ID Based (Yes / No)
        label_from_parameter:
        label_short: MProp ID Based (Yes / No)
        map_layer:
        name: mprop_id_based
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: mprop_id_based
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Is Supplier Name filter (Yes / No)
        label_from_parameter:
        label_short: Is Supplier Name filter (Yes / No)
        map_layer:
        name: is_supplier_name_filter
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: is_supplier_name_filter
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Is No Permissions (Yes / No)
        label_from_parameter:
        label_short: Is No Permissions (Yes / No)
        map_layer:
        name: is_no_permissions
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: history
        suggest_dimension: is_no_permissions
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Is Additional Filters (based on ifnull) (Yes / No)
        label_from_parameter:
        label_short: Is Additional Filters (based on ifnull) (Yes / No)
        map_layer:
        name: is_additional_filters_based_on_ifnull
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: is_additional_filters_based_on_ifnull
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      table_calculations:
      - label: Needs review
        name: needs_review
        expression: if(${lob_id_based} = yes AND ${dates_selected} <= 30 AND NOT ${is_additional_filters_based_on_ifnull},"👀","⏸️")
        can_pivot: false
        sortable: true
        type: string
        align: left
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format:
        pivoted: false
      pivots: []
    series_column_widths:
      history.created_time: 150
    sorts: [needs_review desc]
    dynamic_fields:
    - category: table_calculation
      expression: if(${lob_id_based} = yes AND ${dates_selected} <= 30 AND NOT ${is_additional_filters_based_on_ifnull},"👀","⏸️")
      label: Needs review
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: needs_review
      _type_hint: string
    listen:
    - Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    - Created Time: history.created_time
    row: 44
    col: 0
    width: 24
    height: 11
  - title: Users
    name: Users
    model: system__activity
    explore: history
    type: single_value
    fields: [user.count]
    filters:
      query.id: ''
    limit: 5000
    column_limit: 50
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#00B2A9"
    value_format: "#,##0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
    size_by_field: history.query_run_count
    plot_size_by_field: true
    x_axis_zoom: true
    y_axis_zoom: true
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    hidden_fields: []
    defaults_version: 1
    hidden_points_if_no: []
    hidden_pivots: {}
    font_size: 12
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 0
    col: 0
    width: 8
    height: 2
  - title: Total amount of queries
    name: Total amount of queries
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count]
    filters:
      query.id: ''
    limit: 5000
    column_limit: 50
    query_timezone: user_timezone
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#464585"
    value_format: "#,##0"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}, collection_default: true,
          collection_label: DV Palette, palette_label: Sequential white to blue, palette_type: Sequential,
          palette_stops: [{color: "#FFFFFF", offset: 0}, {color: "#34B233", offset: 100}]},
        bold: false, italic: false, strikethrough: false, fields: []}]
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{axisId: query.count, id: query.count,
            name: Query Count}, {axisId: history.queries_under_10s, id: history.queries_under_10s,
            name: History Queries Under 10s}, {axisId: history.query_run_count, id: history.query_run_count,
            name: History Query Run Count}, {axisId: history.cache_result_query_count,
            id: history.cache_result_query_count, name: History Results from Cache},
          {axisId: history.database_result_query_count, id: history.database_result_query_count,
            name: History Results from Database}, {axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: History Dashboard Run Count}, {
            axisId: history.count, id: history.count, name: History Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.max_runtime,
            id: history.max_runtime, name: History Max Runtime in Seconds}, {axisId: history.average_runtime,
            id: history.average_runtime, name: History Average Runtime in Seconds}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
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
    size_by_field: history.query_run_count
    plot_size_by_field: true
    x_axis_zoom: true
    y_axis_zoom: true
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    hidden_fields: []
    defaults_version: 1
    hidden_points_if_no: []
    hidden_pivots: {}
    font_size: 12
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 0
    col: 8
    width: 8
    height: 2
  - title: Cache/Database Request
    name: Cache/Database Request
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.created_minute, history.count, result_source_groups]
    pivots: [result_source_groups]
    filters: {}
    sorts: [history.created_minute, result_source_groups]
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
    show_x_axis_label: false
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
            id: Query - history.count, name: Query}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [history.count, user.count]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    row: 55
    col: 0
    width: 24
    height: 8
  - name: Long Runs (speed of the query is greater than 15 sec)
    type: text
    title_text: Long Runs (speed of the query is greater than 15 sec)
    subtitle_text: ''
    body_text: ''
    row: 37
    col: 0
    width: 24
    height: 1
  - name: Need review and main reasons (5K queries maximum)
    title: Need review and main reasons (5K queries maximum)
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.id, user.name, history.slug, history.source, history.real_dash_id,
        history.runtime, filter_date_start, filter_date_end]
      filters:
        history.status: complete
        query.model: quality
        history.slug: ''
        user.name: ''
        is_long: 'Yes'
        history.created_time: 25 hour ago for 24 hour
      sorts: [history.runtime desc]
      limit: 5000
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: diff_days(to_date(${filter_date_start}), to_date(${filter_date_end}))+1
        label: Dates Selected
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dates_selected
        _type_hint: number
      - category: dimension
        expression: "${history.runtime}>=15"
        label: Is Long
        value_format:
        value_format_name:
        dimension: is_long
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: substring(${query.filters},position(${query.filters},"datetime_filter")+18,42)
        label: Date Range Selected
        value_format:
        value_format_name:
        dimension: date_range_selected
        _kind_hint: dimension
        _type_hint: string
      - category: dimension
        expression: |-
          if(position(${date_range_selected}, "\",")>0,
            replace(substring(${date_range_selected}, position(${date_range_selected}, "to")+3, 16),"/","-"),
          replace(substring(${date_range_selected}, position(${date_range_selected}, "to")+3, 19),"/","-")
          )
        label: Filter Date End
        value_format:
        value_format_name:
        dimension: filter_date_end
        _kind_hint: dimension
        _type_hint: string
      - category: dimension
        expression: replace(substring(${date_range_selected}, 0, abs(position(${date_range_selected},
          "to")-2)),"/","-")
        label: Filter Date Start
        value_format:
        value_format_name:
        dimension: filter_date_start
        _kind_hint: dimension
        _type_hint: string
      hidden_pivots: {}
      hidden_fields: [filter_date_start, filter_date_end, history.id]
      join_fields: []
    - model: system__activity
      explore: sql_text
      type: table
      fields: [history.id, history.runtime, lob_id_based, mprop_id_based, is_supplier_name_filter,
        is_no_permissions, is_additional_filters]
      filters:
        history.status: complete
        history.connection_name: '"snowflake_dv_quality"'
        is_long: 'Yes'
        history.created_time: 25 hour ago for 24 hour
      sorts: [history.runtime desc]
      limit: 5000
      dynamic_fields:
      - category: dimension
        expression: "${history.runtime}>=15"
        label: Is Long
        value_format:
        value_format_name:
        dimension: is_long
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text},".LOB_ID in (") > 0
        label: Lob ID Based
        value_format:
        value_format_name:
        dimension: lob_id_based
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text}, ".MEDIA_PROPERTY_INTERNAL_ID in
          (") > 0
        label: MProp ID Based
        value_format:
        value_format_name:
        dimension: mprop_id_based
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text}, "where supplier_name in (") >0
        label: Is Supplier Name filter
        value_format:
        value_format_name:
        dimension: is_supplier_name_filter
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: position(${sql_text.sql_text},"WHERE (IFNULL(") > 0
        label: Is Additional Filters
        value_format:
        value_format_name:
        dimension: is_additional_filters
        _kind_hint: dimension
        _type_hint: yesno
      - category: dimension
        expression: NOT ${lob_id_based} AND NOT ${mprop_id_based} AND NOT ${is_supplier_name_filter}
        label: Is No Permissions
        value_format:
        value_format_name:
        dimension: is_no_permissions
        _kind_hint: dimension
        _type_hint: yesno
      query_timezone: user_timezone
      hidden_fields: [history.id]
      hidden_points_if_no:
      join_fields:
      - field_name: history.id
        source_field_name: history.id
    font_size_main: ''
    orientation: auto
    style_need_review: "#3A4245"
    show_title_need_review: true
    title_placement_need_review: above
    value_format_need_review: ''
    style_query_count: "#3A4245"
    show_title_query_count: true
    title_override_query_count: Total Long Queries
    title_placement_query_count: above
    value_format_query_count: ''
    show_comparison_query_count: false
    style_of_30_days_selected: "#3A4245"
    show_title_of_30_days_selected: true
    title_placement_of_30_days_selected: below
    value_format_of_30_days_selected: ''
    show_comparison_of_30_days_selected: false
    style_of_additional_filters_used_based_on_ifnull_condition: "#3A4245"
    show_title_of_additional_filters_used_based_on_ifnull_condition: true
    title_placement_of_additional_filters_used_based_on_ifnull_condition: above
    value_format_of_additional_filters_used_based_on_ifnull_condition: ''
    show_comparison_of_additional_filters_used_based_on_ifnull_condition: false
    style_of_not_lob_based_queries: "#3A4245"
    show_title_of_not_lob_based_queries: true
    title_placement_of_not_lob_based_queries: below
    value_format_of_not_lob_based_queries: ''
    show_comparison_of_not_lob_based_queries: false
    comparison_style_query_count: value
    comparison_show_label_query_count: false
    style_of_needs_review: "#cf2aff"
    show_title_of_needs_review: true
    title_placement_of_needs_review: above
    value_format_of_needs_review: ''
    show_comparison_of_needs_review: false
    style_of_additional_filters_used_based_on_ifnull: "#3A4245"
    show_title_of_additional_filters_used_based_on_ifnull: true
    title_placement_of_additional_filters_used_based_on_ifnull: above
    value_format_of_additional_filters_used_based_on_ifnull: ''
    show_comparison_of_additional_filters_used_based_on_ifnull: false
    custom_color_enabled: true
    custom_color: "#952D98"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, custom: {
            id: 880c4e28-e86f-0af0-dc72-cf78f6767b84, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: orange, offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [dates_selected]}, {type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", user.name, history.slug, history.source,
      history.real_dash_id, history.runtime, needs_review, dates_selected, lob_id_based,
      mprop_id_based, is_supplier_name_filter]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      q1_history.runtime:
        is_active: false
        value_display: true
        palette:
          palette_id: 77372dcb-c936-ac28-cec9-cce1d938b1bd
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#b22624"
    series_text_format:
      q1_history.runtime: {}
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    hidden_fields: [filter_date_end, q1_history.runtime, history.id, user.name, history.slug,
      history.source, history.real_dash_id, history.runtime, filter_date_start, dates_selected,
      lob_id_based, mprop_id_based, is_supplier_name_filter, is_no_permissions, is_additional_filters,
      of_needs_review]
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures: []
      dimensions:
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: The unique numeric identifier for this event. Each event is linked
          to a query in Looker. Includes a link to this query on the Queries page.
          (Requires see_queries permission.)
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: History ID
        label_from_parameter:
        label_short: ID
        map_layer:
        name: history.id
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: ID
        measure: false
        parameter: false
        primary_key: true
        project_name: system__activity
        scope: history
        suggest_dimension: history.id
        suggest_explore: history
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=3"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: history.id
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The user's full name
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: User Name
        label_from_parameter:
        label_short: Name
        map_layer:
        name: user.name
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: user
        view_label: User
        dynamic: false
        week_start_day: monday
        original_view: user
        dimension_group:
        error:
        field_group_variant: Name
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: user
        suggest_dimension: user.name
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/user.view.lkml?line=73"
        permanent: true
        source_file: user.view.lkml
        source_file_path: system__activity/user.view.lkml
        sql: 'CONCAT(${first_name}, '' '', ${last_name}) '
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The unique string identifier for a query.
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Slug
        label_from_parameter:
        label_short: Slug
        map_layer:
        name: history.slug
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Slug
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.slug
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=598"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: history.slug
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The source of a query, such as a Look, an Explore, a scheduled_task,
          an alert, a dashboard etc.
        enumerations:
        field_group_label: Source
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Source
        label_from_parameter:
        label_short: Source
        map_layer:
        name: history.source
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Source
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.source
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=100"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "${TABLE}.SOURCE "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: The unique string identifier for either a user-defined or a LookML
          dashboard
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: History Dashboard ID (Inclusive)
        label_from_parameter:
        label_short: Dashboard ID (Inclusive)
        map_layer:
        name: history.real_dash_id
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Dashboard ID (Inclusive)
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.real_dash_id
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=317"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: |-
          {% if _dialect._name == 'hypersql' %}
                  COALESCE(${dashboard_id}, CONVERT(${dashboard.id}, SQL_VARCHAR))
                {% elsif _dialect._name == 'bigquery_standard_sql' %}
                  COALESCE(${dashboard_id}, CAST(${dashboard.id} AS STRING))
                {% else %}
                  COALESCE(${dashboard_id}, CAST(${dashboard.id} AS CHAR(256)))
                {% endif %}
        sql_case:
        filters:
        times_used: 0
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: The number of seconds a query took to run
        enumerations:
        field_group_label: Runtime Fields
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: History Runtime in Seconds
        label_from_parameter:
        label_short: Runtime in Seconds
        map_layer:
        name: history.runtime
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.###
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Runtime in Seconds
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.runtime
        suggest_explore: history
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=13"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "{% if _dialect._name contains 'mysql' %}\n            CAST(${TABLE}.runtime\
          \ AS DECIMAL(19,4))\n          {% else %}\n            ${TABLE}.runtime\n\
          \          {% endif %} "
        sql_case:
        filters:
        times_used: 0
        sorted:
          sort_index: 0
          desc: true
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Filter Date Start
        label_from_parameter:
        label_short: Filter Date Start
        map_layer:
        name: filter_date_start
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: history
        suggest_dimension: filter_date_start
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Filter Date End
        label_from_parameter:
        label_short: Filter Date End
        map_layer:
        name: filter_date_end
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: history
        suggest_dimension: filter_date_end
        suggest_explore: history
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - type: number
        align: right
        measure: false
        dynamic: false
        can_pivot: false
        is_numeric: true
        name: dates_selected
        label: Dates Selected
        value_format:
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: The number of seconds a query took to run
        enumerations:
        field_group_label: Runtime Fields
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: History Runtime in Seconds
        label_from_parameter:
        label_short: Runtime in Seconds
        map_layer:
        name: q1_history.runtime
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.###
        view: history
        view_label: History
        dynamic: false
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant: Runtime in Seconds
        measure: false
        parameter: false
        primary_key: false
        project_name: system__activity
        scope: history
        suggest_dimension: history.runtime
        suggest_explore: sql_text
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/system__activity/files/history.view.lkml?line=13"
        permanent: true
        source_file: history.view.lkml
        source_file_path: system__activity/history.view.lkml
        sql: "{% if _dialect._name contains 'mysql' %}\n            CAST(${TABLE}.runtime\
          \ AS DECIMAL(19,4))\n          {% else %}\n            ${TABLE}.runtime\n\
          \          {% endif %} "
        sql_case:
        filters:
        times_used: 0
        sorted:
          sort_index: 0
          desc: true
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Lob ID Based (Yes / No)
        label_from_parameter:
        label_short: Lob ID Based (Yes / No)
        map_layer:
        name: lob_id_based
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: lob_id_based
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: MProp ID Based (Yes / No)
        label_from_parameter:
        label_short: MProp ID Based (Yes / No)
        map_layer:
        name: mprop_id_based
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: mprop_id_based
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Is Supplier Name filter (Yes / No)
        label_from_parameter:
        label_short: Is Supplier Name filter (Yes / No)
        map_layer:
        name: is_supplier_name_filter
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: is_supplier_name_filter
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Is No Permissions (Yes / No)
        label_from_parameter:
        label_short: Is No Permissions (Yes / No)
        map_layer:
        name: is_no_permissions
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: history
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: history
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: history
        suggest_dimension: is_no_permissions
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        - label: 'Yes'
          value: 'Yes'
        - label: 'No'
          value: 'No'
        field_group_label:
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Is Additional Filters (Yes / No)
        label_from_parameter:
        label_short: Is Additional Filters (Yes / No)
        map_layer:
        name: is_additional_filters
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: yesno
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: sql_text
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: sql_text
        dimension_group:
        error:
        field_group_variant:
        measure: false
        parameter: false
        primary_key: false
        project_name:
        scope: sql_text
        suggest_dimension: is_additional_filters
        suggest_explore: sql_text
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: ''
        source_file_path: ''
        sql:
        sql_case:
        filters:
        times_used: 0
      table_calculations:
      - label: Need review
        name: need_review
        expression: count(if(${lob_id_based} = yes AND ${dates_selected} <= 30 AND
          NOT ${is_additional_filters},1,null))
        can_pivot: false
        sortable: true
        type: number
        align: right
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format: '0'
        is_numeric: true
      - label: Query Count
        name: query_count
        expression: count(${history.id})
        can_pivot: false
        sortable: true
        type: number
        align: right
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: "% of needs review"
        name: of_needs_review
        expression: count(if(${lob_id_based} = yes AND ${dates_selected} <= 30 AND
          NOT ${is_additional_filters},1,null))/count(${history.id})
        can_pivot: false
        sortable: true
        type: number
        align: right
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: "% of >30 Days selected"
        name: of_30_days_selected
        expression: count(if(${dates_selected} > 30,1,null))/count(${history.id})
        can_pivot: false
        sortable: true
        type: number
        align: right
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: "% of additional filters used (based on ifnull condition)"
        name: of_additional_filters_used_based_on_ifnull_condition
        expression: count(if(NOT ${is_additional_filters},1,null))/count(${history.id})
        can_pivot: false
        sortable: true
        type: number
        align: right
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: "% of not LOB based queries"
        name: of_not_lob_based_queries
        expression: count(if(NOT ${lob_id_based},1,null))/count(${history.id})
        can_pivot: false
        sortable: true
        type: number
        align: right
        measure: false
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    series_types: {}
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: count(if(${lob_id_based} = yes AND ${dates_selected} <= 30 AND NOT
        ${is_additional_filters},1,null))
      label: Need review
      value_format:
      value_format_name: id
      _kind_hint: dimension
      table_calculation: need_review
      _type_hint: number
    - category: table_calculation
      expression: count(${history.id})
      label: Query Count
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: query_count
      _type_hint: number
    - category: table_calculation
      expression: count(if(${lob_id_based} = yes AND ${dates_selected} <= 30 AND NOT
        ${is_additional_filters},1,null))/count(${history.id})
      label: "% of needs review"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      table_calculation: of_needs_review
      _type_hint: number
    - category: table_calculation
      expression: count(if(${dates_selected} > 30,1,null))/count(${history.id})
      label: "% of >30 Days selected"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      table_calculation: of_30_days_selected
      _type_hint: number
    - category: table_calculation
      expression: count(if(NOT ${is_additional_filters},1,null))/count(${history.id})
      label: "% of additional filters used (based on ifnull condition)"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      table_calculation: of_additional_filters_used_based_on_ifnull_condition
      _type_hint: number
    - category: table_calculation
      expression: count(if(NOT ${lob_id_based},1,null))/count(${history.id})
      label: "% of not LOB based queries"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      table_calculation: of_not_lob_based_queries
      _type_hint: number
    listen:
    - Model: query.model
      User Name: user.name
      Slug: history.slug
      Result Source: history.result_source
      Dashboard ID (Inclusive): history.real_dash_id
      Created Time: history.created_time
      Explore: query.view
    - Created Time: history.created_time
    row: 38
    col: 0
    width: 24
    height: 6
  filters:
  - name: Created Time
    title: Created Time
    type: field_filter
    default_value: 24 hour ago for 24 hour
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_time
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
    explore: history
    listens_to_filters: []
    field: user.name
  - name: Slug
    title: Slug
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
    field: history.slug
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
  - name: Explore
    title: Explore
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
    field: query.view
