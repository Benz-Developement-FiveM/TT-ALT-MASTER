Locales['en'] = {
    no_permission = 'Player %s trying to use command / functions without permission',

    --Discord logs
    info_title = 'rcore_guidebook - INFO log',
    critical_title = 'rcore_guidebook - CRITICAL log',
    permission_title = 'rcore_guidebook - PERMISSION log',
    other_title = 'rcore_guidebook - OTHER log',

    --Send help
    send_usage = '/%s [playerId]',
    send_usage_navigate = '/%s [pointKey]',
    player_cannot_be_found_usage = 'Player %s cannot be found',
    page_not_found = 'Page %s cannot be found!',
    point_not_found = 'Point %s cannot be found!',
    navigate_set = 'Navigation point prepared!',
    point_not_allowed = 'You cannot start navigation to this point!',

    help_text = 'Press ~INPUT_CONTEXT~ to open help',

    registered_key_label = 'Opens guidebook',

    ui = {
        general = {
            guide_title = 'Guidebook',
            admin_label = 'ADMIN',
            irreversible = 'This action is <b>irreversible</b>!',
            lost_pages = 'All pages in category will be <b>lost</b>!',
            are_you_sure = 'Are you sure?',
            guidebook_empty = 'Guidebook is empty 😔',
            enabled_tag = 'enabled',
            disabled_tag = 'disabled',
            restricted_tag = 'restricted',
        },
        permissions = {
            title = 'Permissions',
            enabled = 'Permissions enabled',
            jobs = {
                title = "Allowed jobs",
                select_job_title = "Select jobs",
                select_grade_title = "Select minimal grade",
                dialog_title = "Choose a job",
                dialog_description =
                "Choose a job and minimal grade that you want to be able to view this category/page/point. The grade you choose will be the minimal grade required to gain access.",
                grade_and_higher = "'{grade}' and higher",
                all_grades = "All grades",
            },
        },
        category = {
            category = 'Category',
            categories = 'Categories',
            category_empty = 'Empty...',
            category_editing = 'Editing category',
            category_creating = 'Create category',
            new_category_cta = 'New category',
        },
        page = {
            pages = 'Pages',
            page_editing = 'Editing page',
            page_creating = 'Creating page',
            new_page_cta = 'New page',
            empty_custom_content = 'Empty...',
        },
        page_template = {
            not_found_page = "Oh no! We couldn't find this page!",
            not_found_page_2 = "But we found this delicious cupcake for you 🧁!",
            not_exist_or_no_perms = "This page may not exist anymore or you may not have permission to view it.",
            admin_welcome_title = "Important person coming through",
            admin_welcome_text =
            "Welcome to the admin system of this guidebook! Don't forget your tools for the important admin work 🔨🔧"
        },
        editor = {
            alt_tip = 'Drag to resize',
            input_tip = 'Drag to resize',
            float_left = 'Align Left',
            float_right = 'Align Right',
            center = 'Center',
            restore = 'Reset'
        },
        inputs = {
            enabled = 'Enabled',
            label = 'Label',
            key = 'Key',
            order_number = 'Order number',
            expanded = 'Expanded',
            content = 'Content',
            submit = 'Submit',
            delete = 'Delete',
            create = 'Create',
            cancel = 'Cancel',
            deleting = 'Deleting: {name}',
            can_navigate = 'Can navigate',
            blip_enabled = 'Blip enabled',
            blip_sprite = 'Blip sprite',
            blip_display_type = 'Blip display type',
            blip_color = 'Blip color',
            blip_size = 'Blip size',
            marker_enabled = 'Marker Enabled',
            marker_size = 'Marker size',
            marker_rotation = 'Marker rotation',
            marker_color = 'Marker color',
            marker_type = 'Marker type',
            marker_draw_distance = 'Marker Draw Distance',
            size = 'Text size',
            color = 'Text color',
            draw_distance = 'Draw distance',
            open_page = 'Open page',
            marker_font = 'Text font',
            position = 'Position',
            custom_content = 'Custom content',
            nav_btn = 'Create GPS Button',
            nav_btn_description = 'Create a button that will set waypoint when clicked!',
            iframe = 'Embed website',
            iframe_description =
            'Embed a website into the guidebook! Useful to show server rules from website, documents etc.',
            iframe_warning =
            '⚠️ Warning: This feature is experimental! Not all websites support embedding (it can be broken or not show at all)!',
            search = 'Search...',
            category = 'Category',
            url = 'URL',
            is_full_size = 'Stretch to full size',
            is_full_size_description =
            "If enabled, the embed frame will stretch to full size of the guidebook page. (You won't be able to resize it manually.)",
            add = 'Add',
        },
        exceptions = {
            success = 'Success',
            error = 'Error',
            must_be_length_3 = "Must be at least 3 characters long",
            no_spaces = "Can't contain spaces",
            equal_higher_than = 'Must equal or be higher than {number}',
            cant_be_edited = "Can't be edited",
            field_required = 'This field is required!',
            warning = 'Warning!',
        },
        notification = {
            data_save_success = 'Data saved successfully!',
            data_save_error = 'Data failed to save!',
            data_delete_success = 'Data deleted successfully!',
            data_delete_error = 'Data failed to delete!',
            teleport_success = 'Successfully teleported!',
            teleport_error = 'Teleportation failed!',
            link_copied = 'Link copied to clipboard!',
            key_copied_success = 'Key copied to clipboard!',
            key_copied_error = 'Key failed to copy to clipboard!',
            gps_set = 'Navigating to location',
            image_paste_error = "Images can't be pasted, please use the image button in the editor's toolbar.",
            collision = "This page has been edited by someone else just now! Please refresh it.",
            search_too_short = 'Search query must be at least 3 characters long!',
            non_existing_page = 'Page linked to this point does not exist anymore!',
            job_already_defined = 'This job with same grade is already defined!',
            search_too_fast = 'Please wait a moment before searching again!',
            key_exists = 'A category/page/point with this key already exists!',
        },
        point = {
            points = 'Points',
            points_help = 'Create in-game markers or 3D texts with custom content or directly open help page',
            editing_point = 'Editing point',
            creating_point = 'Creating point',
            teleport = "You will be teleported into point location of help point: <strong>{point}</strong>",
            teleportNow = 'Teleport',
            new_point_cta = 'New point',
        },
        placeholders = {
            category_label = 'Gangs...',
            category_key = 'gangs...',
            page_label = 'Getting a gun...',
            page_key = 'gangs-gun...',
            point_label = 'Guns for free here!...',
            point_key = 'get_gun...',
            nav_btn_label = 'Maze bank...',
            iframe_url = 'https://store.rcore.cz...',
            order_number = 'Insert order number...',
        },
        search = {
            title = "Search Results",
            result_count = "Found <strong>{count}</strong> results for <strong>{query}</strong>.",
        },
        tooltip = {
            resize = '☝️ Tip: You can right/left click image/video/(iframe, if enabled) to show resizing tools!',
            arrow_inputs =
            '☝️ Tip: You can use <kbd>&larr;</kbd><kbd>&rarr;</kbd> to change value in range sliders with precision!',
            open_page =
            'Select guide page to open on point interaction or select Custom content to create special page accessible only via this help point.',
            order_number = 'Categories and pages are sorted in ascending order (smallest number first).',
            key = 'Unique key to use for reference, use the generated one, or type in yours.',
            fivem_formatting = '👉 You can use FiveM Text formatting (~n~, ~r~...) for the label!',
            enabled =
            'If enabled, this category/page will appear in the guidebook. However if you disable it, this page/category becomes invisible in the guidebook and accessible only through help point or command to send help!',
            expanded = 'If enabled, this category will be expanded by default.',
            can_navigate = 'If enabled, you can use `/pointgps [pointKey]` to set waypoint to this point.',
            marker_rotation = 'If disabled, marker will always face player, if enabled, marker will have fixed rotation.',
            point_label = "Displayed as 3D Text at given coordinates.",
            blip_enabled = 'If enabled, blip will be visible on the map.',
            blip_sprite = 'Blip icon on the map. Check all available in FiveM docs.',
            blip_color = 'Check all available in FiveM docs.',
            blip_display_type_rest = "Blip behaviour (0-10) - non listed IDs seems to have no effect.",
            blip_display_type_0 = "Doesn't show up, ever, anywhere.",
            blip_display_type_2 = 'Shows on both main map and minimap. (Selectable on map)',
            blip_display_type_3 = 'Shows on main map only. (Selectable on map)',
            blip_display_type_5 = 'Shows on minimap only.',
            blip_display_type_8 = 'Shows on both main map and minimap. (Not selectable on map).',
            blip_display_type_id = "ID",
            blip_display_type_behaviour = "Behaviour",
            marker_type = 'Changes icon of marker. Check all available in FiveM docs.',
            permissions_enabled = 'If enabled, user will see category/page/point only if they meet certain requirements.',
            permissions_job = "Choose jobs and minimal grades that you want to be able to view this category/page/point.",
        }
    }
}
