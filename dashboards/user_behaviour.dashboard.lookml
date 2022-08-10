- dashboard: end_user_behaviour
  title: End User Behaviour
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  query_timezone: user_timezone
  elements:
  - title: Heavy Queries
    name: Heavy Queries
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.id, history.created_time, history.runtime, query.filters]
    sorts: [history.runtime desc]
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
    row: 6
    col: 0
    width: 8
    height: 7
  - title: Live Queries
    name: Live Queries
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, history.status, user.id, user.name, history.runtime,
      history.source, query.id, query.link, query.formatted_fields, history.id]
    sorts: [history.created_time desc]
    limit: 500
    column_limit: 50
    query_timezone: user_timezone
    show_view_names: true
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
    series_column_widths:
      history.created_time: 139
      history.status: 106
      history.runtime: 147
      history.source: 120
      history.id: 122
      user.id: 81
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 6, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [history.runtime]}]
    hidden_fields: [query.id, user.name, query.link]
    defaults_version: 1
    series_types: {}
    hidden_points_if_no: []
    listen:
      Completed Date: history.completed_date
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
    row: 15
    col: 0
    width: 24
    height: 5
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
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
      history.message: "%error%"
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
    series_colors:
      history.count: "#FF8168"
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", history.message, history.created_time, history.id,
      query.id, query.link]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      history.count:
        is_active: true
        palette:
          palette_id: d8b60d3e-e77b-41eb-df9e-47c0ac52cf29
          collection_id: dv-palette
          custom_colors:
          - "#FFFFFF"
          - "#b23c68"
        value_display: false
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    show_null_points: true
    up_color: false
    down_color: false
    total_color: false
    listen:
      Completed Date: history.completed_date
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
    row: 20
    col: 0
    width: 24
    height: 4
  - title: Dashboards Run Count
    name: Dashboards Run Count
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Users and Average Run Time
    name: Users and Average Run Time
    model: system__activity
    explore: user
    type: looker_line
    fields: [user.count, history.completed_date, history.average_runtime]
    fill_fields: [history.completed_date]
    filters:
      user.is_disabled: 'No'
    sorts: [history.completed_date desc]
    limit: 500
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
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: user.count,
            id: user.count, name: Users Count}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      history.average_runtime: area
    series_colors:
      user.count: "#263c85"
      history.average_runtime: "#00B2A9"
    series_labels:
      user.count: Users Count
    series_point_styles:
      user.count: auto
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
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
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
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
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Total named embed users with "explore" or "save content" permissions
      and not "admin" or "developer" permissions (non-disabled).
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      LookML Dashboard: history.real_dash_id
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
      Query Status: history.status
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Downloads and Sending Data
    name: Downloads and Sending Data
    model: system__activity
    explore: event_attribute
    type: looker_grid
    fields: [event.created_time, user.id, user.name, event_attribute.name, event_attribute.value]
    filters:
      event.category: query
      event.name: '"export_query"'
      event_attribute.value: -"json_fe"
      event_attribute.name: '"export_format"'
    sorts: [event.created_time desc]
    limit: 500
    query_timezone: America/New_York
    show_view_names: true
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
    show_totals: true
    show_row_totals: true
    defaults_version: 1
    listen:
      Completed Date: event.created_date
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
    row: 28
    col: 0
    width: 24
    height: 5
  - title: 'Scheduled content - Unlimited results '
    name: 'Scheduled content - Unlimited results '
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job.id, scheduled_job.content_link, user.id, scheduled_job.created_time,
      scheduled_job.finalized_time]
    filters:
      scheduled_plan.send_all_results: 'Yes'
    sorts: [scheduled_job.created_time desc]
    limit: 500
    show_view_names: true
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
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      scheduled_job.count:
        is_active: true
    defaults_version: 1
    listen:
      Completed Date: scheduled_job.created_date
      Is Embed (Yes / No): user_facts.is_embed
      Salesforce External ID: user_facts.external_id
      Looker User ID: user_facts.user_id
    row: 24
    col: 0
    width: 24
    height: 4
  - name: ALL CONTENT
    type: text
    title_text: ALL CONTENT
    subtitle_text: Personal content interactions are included and Query Status filter
      is not applied
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 2
  filters:
  - name: Completed Date
    title: Completed Date
    type: date_filter
    default_value: 7 days ago for 7 days
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: inline
      options: []
  - name: LookML Dashboard
    title: LookML Dashboard
    type: field_filter
    default_value: pa^_general%
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - pa_general::blocking
      - pa_general::blocking_disclosure
      - pa_general::monitoring
      - pa_general::monitoring_disclosure
      - pa_general::monitoring_spotx
      - pa_general::monitoring_spotx_disclosure
      - pa_general::network_wide_viewability
      - pa_general::summary_groupm
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
  - name: Salesforce External ID
    title: Salesforce External ID
    type: field_filter
    default_value: "-0055d00000BQu1bAAD,-0055d00000BE4rgAAD"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: user_facts.external_id
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
  - name: Query Status
    title: Query Status
    type: field_filter
    default_value: complete
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.status
