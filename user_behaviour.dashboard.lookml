- dashboard: end_user_behaviour
  title: End User Behaviour
  layout: newspaper
  preferred_viewer: dashboards
  query_timezone: user_timezone
  elements:
  - title: Heavy Queries
    name: Heavy Queries
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, history.runtime, history.id, query.filters]
    filters:
      history.runtime: ''
      history.source: dashboard
      history.is_single_query: 'Yes'
      history.status: complete
      dashboard.id: 'NULL'
      dashboard.title: 'NULL'
      model_set.models: '"pa_general"'
    sorts: [history.created_time desc, history.runtime desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'NOT contains(${query.filters},"101,
          102")', label: is not for all platforms, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: is_not_for_all_platforms, _type_hint: yesno}]
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
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_column_widths:
      history.id: 91
      query.filters: 443
    defaults_version: 1
    hidden_points_if_no: [is_for_all, is_not_for_all_platforms]
    hidden_fields: [query.filters]
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 6
    col: 16
    width: 8
    height: 7
  - title: Run Time Distribution by Dashboard
    name: Run Time Distribution by Dashboard
    model: system__activity
    explore: history
    type: looker_boxplot
    fields: [history.min_runtime, history.average_runtime, history.max_runtime, dashboard]
    filters:
      history.runtime: ''
      history.real_dash_id: "-NULL"
      history.is_single_query: 'Yes'
      history.status: complete
      dashboard.id: 'NULL'
      dashboard.title: 'NULL'
      history.source: dashboard
      model_set.models: '"pa_general"'
    sorts: [dashboard]
    limit: 500
    dynamic_fields: [{category: dimension, expression: 'substring(${history.dashboard_id},position(${history.dashboard_id},":")+2,100)',
        label: Dashboard, value_format: !!null '', value_format_name: !!null '', dimension: dashboard,
        _kind_hint: dimension, _type_hint: string}]
    query_timezone: user_timezone
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 14
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    color_application:
      collection_id: dv-palette
      palette_id: dv-palette-categorical-0
      options:
        steps: 5
        reverse: false
    y_axis_labels: [Run Time, sec]
    y_axis_value_format: "#"
    x_axis_label: LookML Dashboard
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
    defaults_version: 1
    series_types: {}
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
    hidden_fields:
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 6
    col: 0
    width: 8
    height: 7
  - title: Live Queries
    name: Live Queries
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, history.status, user.name, history.runtime, history.source,
      history.id, query.id, query.link, query.formatted_fields]
    sorts: [history.created_time desc]
    limit: 500
    query_timezone: user_timezone
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 6, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [history.runtime]}]
    hidden_fields: [history.id, query.id, query.formatted_fields, user.name]
    defaults_version: 1
    series_types: {}
    hidden_points_if_no: []
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 13
    col: 0
    width: 24
    height: 5
  - title: Queries - Distribution by Runtime
    name: Queries - Distribution by Runtime
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.runtime_tiers_5, history.query_run_count]
    fill_fields: [history.runtime_tiers_5]
    filters:
      history.result_source: query
      query.model: '"pa_general"'
    sorts: [history.runtime_tiers_5]
    limit: 500
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
    defaults_version: 1
    hidden_fields: []
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 6
    col: 8
    width: 8
    height: 7
  - title: Queries - Error Messages
    name: Queries - Error Messages
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.count, error_message]
    filters:
      history.message: "%SQL Syntax Error%"
    sorts: [history.count desc]
    limit: 500
    dynamic_fields: [{category: dimension, expression: 'substring(${history.message},position(${history.message},"invalid"),100)',
        label: Error Message, value_format: !!null '', value_format_name: '', dimension: error_message,
        _kind_hint: dimension, _type_hint: string}]
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
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: history.count, id: history.count,
            name: History Count}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    show_row_numbers: true
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
    show_totals: true
    show_row_totals: true
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", history.message, history.created_time, history.id,
      query.id, query.link]
    show_null_points: true
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 18
    col: 0
    width: 24
    height: 5
  - title: Dashboards Run Count
    name: Dashboards Run Count
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
    filters:
      history.result_source: query
      query.model: '"pa_general"'
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
    series_types: {}
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Users
    name: Users
    model: system__activity
    explore: user
    type: single_value
    fields: [user.count]
    filters: {}
    limit: 500
    filter_expression: "(${user_facts.is_explorer} OR ${user_facts.is_content_saver})"
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
    query_timezone: user_timezone
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
    series_types: {}
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
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Users and Run Time
    name: Users and Run Time
    model: system__activity
    explore: user
    type: looker_line
    fields: [user.count, history.completed_date, history.average_runtime]
    fill_fields: [history.completed_date]
    filters: {}
    sorts: [history.completed_date desc]
    limit: 500
    filter_expression: "(${user_facts.is_explorer} OR ${user_facts.is_content_saver})"
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
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: user.count, id: user.count,
            name: User}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: history.average_runtime, id: history.average_runtime, name: Average
              Runtime in Seconds}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    query_timezone: user_timezone
    series_types:
      history.average_runtime: area
    series_colors:
      user.count: "#079C98"
      history.average_runtime: "#B2B4B3"
    series_point_styles: {}
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
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 0
    col: 6
    width: 12
    height: 6
  - title: Dashboards per User per Day
    name: Dashboards per User per Day
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count, user_facts.count, days_in_period]
    filters:
      history.result_source: query
      query.model: '"pa_general"'
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${history.dashboard_run_count}/(${user_facts.count}*${days_in_period})",
        label: Dash per User per Day, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: dash_per_user_per_day, _type_hint: number},
      {category: measure, expression: !!null '', label: days in period, value_format: !!null '',
        value_format_name: !!null '', based_on: history.completed_date, _kind_hint: measure,
        measure: days_in_period, type: count_distinct, _type_hint: number}]
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
    hidden_fields: [user_facts.count, history.dashboard_run_count, days_in_period]
    series_types: {}
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 3
    col: 18
    width: 6
    height: 3
  - title: Run Time, sec
    name: Run Time, sec
    model: system__activity
    explore: user
    type: single_value
    fields: [history.average_runtime]
    filters: {}
    limit: 500
    query_timezone: user_timezone
    filter_expression: "(${user_facts.is_explorer} OR ${user_facts.is_content_saver})"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Total named embed users with "explore" or "save content" permissions
      and not "admin" or "developer" permissions (non-disabled).
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Is Admin (Yes / No): user_facts.is_admin
      Is Developer (Yes / No): user_facts.is_developer
      Is Embed (Yes / No): user_facts.is_embed
      Is Looker Employee (Yes / No): user_facts.is_looker_employee
      Is Disabled (Yes / No): user.is_disabled
    row: 3
    col: 0
    width: 6
    height: 3
  filters:
  - name: Completed Date
    title: Completed Date
    type: date_filter
    default_value: 5 days
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Is Admin (Yes / No)
    title: Is Admin (Yes / No)
    type: string_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
  - name: Is Developer (Yes / No)
    title: Is Developer (Yes / No)
    type: string_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
  - name: Is Embed (Yes / No)
    title: Is Embed (Yes / No)
    type: string_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
  - name: Is Looker Employee (Yes / No)
    title: Is Looker Employee (Yes / No)
    type: string_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
  - name: Is Disabled (Yes / No)
    title: Is Disabled (Yes / No)
    type: string_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
