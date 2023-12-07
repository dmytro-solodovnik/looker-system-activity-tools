- dashboard: system_queries__60_minutes
  title: "[System] Queries - 60 minutes"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Helps to analyse most recent instance queries. There is ability to
    adjust time, filter by User Name, Looker Instance Slug and Used Fields'
  query_timezone: user_timezone
  elements:
  - title: Queries - Recent
    name: Queries - Recent
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, history.status, history.slug, history.id, query.id,
      user.name, history.runtime, history.source, query.model, history.connection_name,
      query.view, history.result_source, query.formatted_fields]
    filters:
      user.name: ''
      query.model: -"system__activity"
      history.most_recent_length: ''
      history.id: ''
      query.formatted_fields: ''
    sorts: [history.created_time desc]
    limit: 5000
    column_limit: 50
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
    truncate_header: false
    series_labels: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00B2A9",
        font_color: !!null '', color_application: {collection_id: dv-palette, palette_id: dv-palette-sequential-0,
          options: {steps: 3, reverse: true, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [history.runtime]}]
    series_value_format:
      history.id:
        name: id
        format_string: '0'
        label: ID
      query.id:
        name: id
        format_string: '0'
        label: ID
    hidden_fields: [history.id, query.id]
    defaults_version: 1
    hidden_points_if_no: []
    hidden_pivots: {}
    series_column_widths:
      user.name: 162
      history.created_time: 162
      query.formatted_fields: 497
      history.status: 140
    column_order: ["$$$_row_numbers_$$$", history.created_time, history.status, query.id,
      user.name, history.result_source, history.runtime, history.source, history.id,
      history.slug, query.formatted_fields, query.model, history.connection_name,
      query.view]
    title_hidden: true
    listen:
      Created Time: history.created_time
      Slug: history.slug
    row: 3
    col: 0
    width: 24
    height: 12
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"How to use:","bold":true}],"id":1701968887586},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard is designed to show most recent queries on the instance"}],"id":1680749533581}],"id":1680749551915},{"type":"li","children":[{"type":"lic","children":[{"text":"Table
      chart shows detailed inforamation about queries - Status, User Name, Result
      Source, Runtime, etc"}],"id":1701905542721}],"id":1701905542721},{"type":"li","children":[{"type":"lic","children":[{"text":"Filters:
      Created Time (by default - last 60 minutes), User Name, Model (by default -
      not system activity data), Fields Used and Slug (Unique Looker Identificator
      of the Query)"}],"id":1701969076598}],"id":1701969076598},{"type":"li","children":[{"type":"lic","children":[{"text":"📝
      Clicking on Slug value it''s possible to drill in on Admin → Query page and
      see detailed info about the query and SQL as well."}],"id":1701969078402}],"id":1701969078402}],"id":1701968887586}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 3
  filters:
  - name: Created Time
    title: Created Time
    type: field_filter
    default_value: 60 minutes
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: history
    listens_to_filters: []
    field: history.created_time
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
  - name: Model
    title: Model
    type: field_filter
    default_value: -"system__activity"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: system__activity
    explore: query
    listens_to_filters: []
    field: query.model
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
    explore: query
    listens_to_filters: []
    field: query.formatted_fields
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
