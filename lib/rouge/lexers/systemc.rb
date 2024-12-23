# -*- coding: utf-8 -*- #
# frozen_string_literal: true

module Rouge
  module Lexers
    class SystemC < RegexLexer
      tag 'systemc'
      aliases 'sc'
      filenames '*.cpp', '*.hpp',
                '*.c++', '*.h++',
                '*.cc',  '*.hh',
                '*.cxx', '*.hxx',
                '*.pde', '*.ino',
                '*.tpp', '*.h'
      mimetypes 'text/x-c++hdr', 'text/x-c++src'

      title "SystemC"
      desc "The SystemC modeling language"

      # optional comment or whitespace
      ws = %r((?:\s|//.*?\n|/[*].*?[*]/)+)
      id = /[a-zA-Z_][a-zA-Z0-9_]*/

      def self.keywords
        @keywords ||= Set.new %w(
          SC_MODULE SC_METHOD SC_THREAD SC_CTOR SC_CTHREAD SC_NAMED
          SC_FORK SC_JOIN SC_ZERO_TIME
          SC_STOP_FINISH_DELTA SC_STOP_IMMEDIATE
          SC_ELABORATION SC_BEFORE_END_OF_ELABORATION SC_END_OF_ELABORATION
          SC_START_OF_SIMULATION SC_RUNNING SC_PAUSED SC_SUSPENDED SC_STOPPED SC_END_OF_SIMULATION
          SC_POST_BEFORE_END_OF_ELABORATION SC_POST_END_OF_ELABORATION SC_POST_START_OF_SIMULATION
          SC_POST_UPDATE SC_PRE_TIMESTEP SC_PRE_PAUSE SC_PRE_SUSPEND SC_POST_SUSPEND SC_PRE_STOP
          SC_POST_END_OF_SIMULATION
          SC_NO_PROC_ SC_METHOD_PROC_ SC_THREAD_PROC_ SC_CTHREAD_PROC_
          SC_NO_DESCENDANTS SC_INCLUDE_DESCENDANTS
          SC_RUN_TO_TIME SC_EXIT_ON_STARVATION
          SC_SEC SC_MS SC_US SC_NS SC_PS SC_FS SC_AS SC_ZS SC_YS
          SC_REPORT_INFO SC_REPORT_ERROR SC_REPORT_WARNING SC_REPORT_FATAL SC_REPORT_INFO_VERB
          SC_INFO SC_WARNING SC_ERROR SC_FATAL
          SC_BIND_PROXY_NIL
          SC_ONE_OR_MORE_BOUND SC_ZERO_OR_MORE_BOUND SC_ALL_BOUND
          sc_assert SC_ON SC_OFF
          Log_0 Log_1 Log_Z Log_X
          SC_ONE_WRITER SC_MANY_WRITERS SC_DEFAULT_WRITER_POLICY
          SC_LOGIC_0 SC_LOGIC_1 SC_LOGIC_X SC_LOGIC_Z
          SC_NOBASE SC_BIN SC_OCT SC_DEC SC_HEX SC_BIN_US SC_BIN_SM SC_OCT_US
          SC_OCT_SM SC_HEX_US SC_HEX_SM SC_CSD
          SC_SAT SC_SAT_ZERO SC_SAT_SYM SC_WRAP SC_WRAP_SM SC_F SC_E
          SC_RND SC_RND_ZERO SC_RND_MIN_INF SC_RND_INF SC_RND_CONV SC_TRN SC_TRN_ZERO
          SC_DEFAULT_Q_MODE_ SC_DEFAULT_N_BITS_ SC_DEFAULT_O_MODE_
          DECL_CTORS_T_A DECL_ASN_OP_T DECL_ASN_OP_OTHER DECL_ASN_OP DECL_ASN_OP_T_A
          DECL_ASN_OP_A DECL_CTORS_T DECL_CTORS_T_B DECL_CTORS_T_A
          DECL_REL_OP_T DECL_REL_OP DECL_REL_OP_OTHER DECL_BIN_OP_T DECL_BIN_OP_OTHER
          DECL_BIN_OP 
          SC_NOW SC_LATER SC_MAX_SEVERITY
          SC_NONE SC_LOW SC_MEDIUM SC_HIGH SC_FULL SC_DEBUG
          SC_UNSPECIFIED SC_DO_NOTHING SC_THROW SC_LOG SC_DISPLAY SC_CACHE_REPORT
          SC_INTERRUPT SC_STOP SC_ABORT
          SC_DEFAULT_INFO_ACTIONS SC_DEFAULT_WARNING_ACTIONS
          SC_DEFAULT_ERROR_ACTIONS SC_DEFAULT_FATAL_ACTIONS
          SC_VECTOR_LOCK_AFTER_INIT SC_VECTOR_LOCK_AFTER_ELABORATION
          SC_VERSION_MAJOR SC_VERSION_MINOR SC_VERSION_PATCH SC_VERSION_ORIGINATOR
          SC_VERSION_RELEASE_DATE SC_VERSION_PRERELEASE SC_IS_PRERELEASE
          SC_VERSION SC_COPYRIGHT IEEE_1666_SYSTEMC
          TLM_VERSION_MAJOR TLM_VERSION_MINOR TLM_VERSION_PATCH TLM_VERSION_ORIGINATOR
          TLM_VERSION_RELEASE_DATE TLM_VERSION_PRERELEASE TLM_IS_PRERELEASE
          TLM_VERSION TLM_COPYRIGHT
          TLM_ACCEPTED TLM_UPDATED TLM_COMPLETED
          UNINITIALIZED_PHASE BEGIN_REQ END_REQ BEGIN_RESP END_RESP
          DMI_ACCESS_NONE DMI_ACCESS_READ DMI_ACCESS_WRITE DMI_ACCESS_READ_WRITE
          TLM_MIN_PAYLOAD TLM_FULL_PAYLOAD TLM_FULL_PAYLOAD_ACCEPTED
          TLM_READ_COMMAND TLM_WRITE_COMMAND TLM_IGNORE_COMMAND
          TLM_OK_RESPONSE TLM_INCOMPLETE_RESPONSE TLM_GENERIC_ERROR_RESPONSE 
          TLM_ADDRESS_ERROR_RESPONSE TLM_COMMAND_ERROR_RESPONSE TLM_BURST_ERROR_RESPONSE
          TLM_BYTE_ENABLE_ERROR_RESPONSE TLM_BYTE_DISABLED TLM_BYTE_ENABLED
          TLM_UNKNOWN_SOCKET TLM_INITIATOR_SOCKET TLM_TARGET_SOCKET
          TLM_UNKNOWN_ENDIAN TLM_LITTLE_ENDIAN TLM_BIG_ENDIAN
          TLM_DECLARE_EXTENDED_PHASE
        )
      end

      def self.constants
        @constants ||= Set.new %w(
          sc_version_major sc_version_minor sc_version_patch sc_version_originator
          sc_version_release_date sc_version_prerelease sc_is_prerelease
          sc_version_string sc_copyright_string
          tlm_version_major tlm_version_minor tlm_version_patch tlm_version_originator
          tlm_version_release_date tlm_version_prerelease tlm_is_prerelease
          tlm_version_string tlm_copyright_string
        )
      end

      def self.keywords_type
        @keywords_type ||= Set.new %w(
          sc_uint sc_int sc_bigint sc_biguint
          sc_uint_base sc_int_base uint_type int_type
          sc_unsigned sc_signed
          int64 uint64 sc_logic
          sc_report_handler_proc
          tlm_phase
        )
      end

      def self.name_class
        @name_class ||= Set.new %w(
          sc_module sc_module_name sc_object sc_event sc_event_or_list sc_event_and_list
          sc_port sc_port_b sc_port_base sc_export sc_export_base sc_in sc_out sc_inout sc_in_clk
          sc_signal sc_signal_in_if sc_signal_inout_if sc_signal_write_if
          sc_time sc_process_handle sc_signal_resolved sc_exception
          sc_behavior sc_channel sc_prim_channel sc_interface sc_report
          sc_event_finder sc_spawn_options sc_spawn sc_generic_base
          sc_bind sc_ref sc_cref sc_logic sc_stub
          sc_out_resolved sc_inout_resolved sc_signal_rv sc_in_rv sc_inout_rv
          sc_out_rv sc_fifo_nonblocking_in_if sc_fifo_in_if
          sc_fifo_nonblocking_out_if sc_fifo_out_if sc_fifo sc_fifo_out sc_mutex_if
          sc_report_handler sc_buffer sc_clock sc_mutex sc_semaphore_if
          sc_stage_callback_if sc_trace_file sc_event_queue_if
          sc_unwind_exception sc_event_finder_t
          sc_attr_base sc_hierarchy_scope sc_attr_cltn sc_attribute
          sc_bv_base sc_lv_base sc_length_param sc_length_context sc_bv sc_lv
          sc_fxtype_params sc_fxtype_context sc_fxcast_switch
          sc_fxnum sc_fxnum_fast sc_fxcast_context
          sc_vector_base sc_vector sc_vector_assembly
          tlm_blocking_transport_if tlm_generic_payload
          tlm_fw_nonblocking_transport_if tlm_bw_nonblocking_transport_if tlm_dmi
          tlm_fw_direct_mem_if tlm_bw_direct_mem_if tlm_mm_interface
          tlm_extension_base tlm_extension tlm_base_protocol_types tlm_quantumkeeper
          tlm_transport_dbg_if tlm_global_quantum tlm_base_socket_if
          tlm_base_initiator_socket tlm_base_target_socket tlm_tag
          tlm_blocking_put_if tlm_blocking_get_if tlm_blocking_peek_if tlm_nonblocking_put_if
          tlm_nonblocking_get_if tlm_nonblocking_peek_if tlm_put_if tlm_get_if tlm_peek_if
          tlm_blocking_get_peek_if tlm_nonblocking_get_peek_if tlm_get_peek_if tlm_transport_if
          tlm_fifo_debug_if 
          tlm_base_initiator_socket_b tlm_base_target_socket_b
          tlm_fw_transport_if tlm_bw_transport_if tlm_write_if
          tlm_initiator_socket tlm_target_socket tlm_analysis_port tlm_analysis_if
          tlm_fifo tlm_analysis_fifo tlm_fifo_get_if tlm_fifo_put_if
          multi_passthrough_initiator_socket multi_passthrough_target_socket
          simple_target_socket simple_initiator_socket simple_target_socket_tagged
          passthrough_target_socket_tagged
          simple_initiator_socket_tagged passthrough_target_socket
          peq_with_cb_and_phase instance_specific_extension_accessor instance_specific_extension
        )
      end

      def self.name_class_daggered
        @name_class_daggered ||= Set.new %w(
          sc_bind_proxy sc_fxnum_fast_bitref sc_int_subref_r sc_uint_bitref_r
          sc_bitref sc_fxnum_fast_subref sc_sensitive sc_uint_subref
          sc_bitref_r sc_fxnum_subref sc_signed_bitref sc_uint_subref_r
          sc_concatref sc_fxnum_bitref_r sc_signed_bitref_r sc_unsigned_bitref
          sc_concref sc_fxnum_fast_bitref_r sc_signed_subref sc_unsigned_bitref_r
          sc_concref_r sc_fxnum_fast_subref_r sc_signed_subref_r sc_unsigned_subref
          sc_context_begin sc_fxnum_subref_r sc_subref sc_unsigned_subref_r
          sc_event_and_expr sc_int_bitref sc_subref_r sc_value_base
          sc_event_or_expr sc_int_bitref_r sc_switch sc_vector_iter
          sc_fxnum_bitref sc_int_subref sc_uint_bitref
          multi_init_base multi_target_base
        )
      end

      def self.name_function
        @name_function ||= Set.new %w(
          sc_start sc_time_stamp sc_main sc_gen_unique_name sc_elab_and_sim sc_argc sc_argv
          sc_pause sc_stop sc_delta_count sc_delta_count_at_current_time sc_pending_activity_at_current_time
          sc_is_running sc_pending_activity_at_future_time sc_pending_activity sc_time_to_pending_activity
          sc_get_time_resolution sc_set_time_resolution sc_max_time sc_get_top_level_objects
          sc_start_of_simulation_invoked sc_end_of_simulation_invoked
          kind sensitive  sc_get_status stop_after
          get_child_objects get_child_events  get_parent_object get_process_object
          sync_reset_on sync_reset_off notify sc_hierarchical_name_exists
          sc_register_hierarchical_name sc_unregister_hierarchical_name
          sync need_sync set_and_sync
          suspend resume disable enable kill throw_it get_writer_policy
          request_update async_request_update get_hierarchy_scope get_current_sc_object
          read write posedge negedge neg get_root event
          posedge_event negedge_event value_changed_event sc_tie
          dont_initialize next_trigger set_stack_size wait
          before_end_of_elaboration end_of_elaboration start_of_simulation end_of_simulation
          spawn_method set_sensitivity reset_signal_is async_reset_signal_is
          sc_set_stop_mode sc_get_stop_mode initialize to_sc_signed
          sc_register_stage_callback sc_unregister_stage_callback
          lock trylock unlock trywait post get_value cancel_all
          sc_suspend_all sc_unsuspend_all sc_unsuspendable sc_suspendable
          stage_callback print dump unbind get_interface_type get_interface
          what is_reset sc_get_current_process_handle begin end
          swap basename proc_kind dynamic terminated terminated_event is_unwinding
          from_value from_seconds from_string to_string to_double to_seconds value
          name reset_event sc_is_unwinding valid size default_event
          in_hierarchy triggered cancel sc_find_event sc_find_object register_port
          async_attach_suspending async_detach_suspending update
          add_attribute get_attribute remove_attribute remove_all_attributes attr_cltn num_attributes
          duty_cycle posedge_first start_time period value_changed sc_trace
          to_char to_bool to_float to_short to_ushort is_01 scan length to_int to_uint to_long to_ulong to_int64 to_uint64
          and_reduce nand_reduce or_reduce nor_reduce xor_reduce xnor_reduce
          lrotate rrotate reverse range len reversed concat to_dec to_bin to_oct to_hex
          o_mode n_bits iwl wl cast_switch is_neg is_zero overflow_flag quantization_flag
          to_signed to_unsigned default_value q_mode
          nb_read nb_write data_written_event data_read_event num_available
          num_free concat_clear_data concat_get_ctrl concat_get_data concat_get_uint64
          concat_length concat_set type_params set_actions get_base_interface
          get put nb_expand nb_reduce used debug to_sc_unsigned
          set_time_unit sc_create_vcd_trace_file sc_close_vcd_trace_file sc_write_comment
          get_count set_verbosity_level get_verbosity_level suppress force
          set_handler get_handler default_handler get_new_action_id get_cached_report
          clear_cached_report set_log_file_name get_log_file_name report
          sc_assertion_failed sc_interrupt_here sc_stop_here
          get_elements init emplace_back_with_name emplace_back at
          cbegin cend sc_assemble_vector create_element
          get_severity get_msg_type get_msg get_verbosity get_file_name get_line_number
          get_time get_process_name
          sc_abs sc_max sc_min operator
          sc_copyright sc_version sc_release
          tlm_release tlm_version tlm_copyright
          nb_transport_bw nb_transport_fw b_transport
          get_start_address get_end_address get_read_latency get_write_latency get_granted_access
          is_none_allowed is_read_allowed is_write_allowed is_read_write_allowed get_dmi_ptr
          set_dmi_ptr set_start_address set_end_address set_read_latency set_write_latency
          set_granted_access allow_none allow_read allow_write allow_read_write
          get_direct_mem_ptr invalidate_direct_mem_ptr free max_num_extensions
          clone copy_from set_mm has_mm acquire release get_ref_count 
          deep_copy_from update_original_from update_extensions_from free_all_extensions
          transport_dbg instance set inc compute_local_quantum
          get_base_port get_base_export get_bus_width get_protocol_types get_socket_category
          is_multi_socket get_gp_option set_gp_option nb_put nb_can_put nb_poke nb_peek nb_unbound nb_bound
          nb_get nb_can_get peek nb_can_peek transport
          set_command get_command is_read set_read is_write set_write get_address set_address get_data_ptr set_data_ptr
          get_data_length set_data_length get_streaming_width set_streaming_width
          get_byte_enable_ptr set_byte_enable_ptr get_byte_enable_length set_byte_enable_length
          set_dmi_allowed is_dmi_allowed get_response_status set_response_status get_response_string
          is_response_ok is_response_error set_extension set_auto_extension
          get_extension clear_extension release_extension resize_extensions
          register_nb_transport_fw register_b_transport register_transport_dbg register_get_direct_mem_ptr
          register_nb_transport_bw register_invalidate_direct_mem_ptr 
          set_global_quantum peq_with_get get_next_transaction get_phase
          get_host_endianness host_has_little_endiannes has_host_endianness
          tlm_to_hostendian_generic tlm_to_hostendian_word tlm_to_hostendian_aligned
          tlm_to_hostendian_single tlm_from_hostendian_single tlm_from_hostendian
          get_local_time get_current_time get_global_quantum
        )
      end

      def self.keywords_enum
        @keywords_enum ||= Set.new %w(
          sc_stop_mode sc_status sc_stage sc_curr_proc_kind
          sc_descendant_inclusion_info
          sc_starvation_policy
          sc_time_unit sc_writer_policy
          sc_port_policy
          sc_logic_value_t sc_numrep
          sc_fixed sc_ufixed sc_fix sc_ufix sc_fxval
          sc_fixed_fast sc_ufixed_fast sc_fix_fast sc_ufix_fast sc_fxval_fast
          sc_o_mode sc_fmt sc_q_mode
          sc_actions sc_severity sc_verbosity
          sc_vector_init_policy
          tlm_sync_enum tlm_phase_enum dmi_access_e tlm_gp_option tlm_command
          tlm_response_status tlm_socket_category tlm_endianness
        )
      end  

      def self.reserved
        @reserved ||= Set.new %w()
      end

      def self.builtins
        @builtins ||= []
      end

      start { push :bol }

      state :expr_bol do
        mixin :inline_whitespace

        rule %r/#if\s0/, Comment, :if_0
        # disable macros
        # rule %r/#/, Comment::Preproc, :macro

        rule(//) { pop! }
      end

      # :expr_bol is the same as :bol but without labels, since
      # labels can only appear at the beginning of a statement.
      state :bol do
        rule %r/#{id}:(?!:)/, Name::Label
        mixin :expr_bol
      end

      state :inline_whitespace do
        rule %r/[ \t\r]+/, Text
        rule %r/\\\n/, Text # line continuation
        rule %r(/(\\\n)?[*].*?[*](\\\n)?/)m, Comment::Multiline
      end

      state :whitespace do
        rule %r/\n+/m, Text, :bol
        rule %r(//(\\.|.)*?$), Comment::Single, :bol
        mixin :inline_whitespace
      end

      state :expr_whitespace do
        rule %r/\n+/m, Text, :expr_bol
        mixin :whitespace
      end

      state :statements do
        mixin :whitespace
        rule %r/(u8|u|U|L)?"/, Str, :string
        rule %r((u8|u|U|L)?'(\\.|\\[0-7]{1,3}|\\x[a-f0-9]{1,2}|[^\\'\n])')i, Str::Char
        rule %r((\d+[.]\d*|[.]?\d+)e[+-]?\d+[lu]*)i, Num::Float
        rule %r(\d+e[+-]?\d+[lu]*)i, Num::Float
        rule %r/0x[0-9a-f]+[lu]*/i, Num::Hex
        rule %r/0[0-7]+[lu]*/i, Num::Oct
        rule %r/\d+[lu]*/i, Num::Integer
        rule %r/implementation\-defined|implementation\-defined_string/, Comment
        rule %r/implementation\-defined_date|implementation\-defined_bool/, Comment
        rule %r/implementation\-defined_number/, Comment
        rule %r(\*/), Error
        rule %r/[()\[\],.;]/, Punctuation
        rule %r/(sc_dt|sc_core|sc_unnamed|tlm|tlm_utils)\b/, Keyword::Namespace
        rule %r/operator\(\)|operator\[\]|operator\=|operator\-\>/, Operator
        rule %r/operator\+|operator\-|operator\\|operator\%|operator\*>/, Operator
        rule %r/operator +IF\&|operator +const +IF\&/, Operator
        rule %r/operator +new|rule operator +new\[\]/, Operator
        rule %r/operator +const +T\&|operator\<\<|operator\>\>/, Operator
        rule %r/operator +const +bool\&/, Operator
        rule %r/operator +const +char\*/, Operator
        rule %r/operator +const +sc_event_and_list\&/, Operator
        rule %r/operator +const +sc_event_or_list\&/, Operator
        rule %r/operator +bool/, Operator
        rule %r/operator +const +sc_dt::sc_logic\&/, Operator
        rule %r/operator +const +sc_logic\&/, Operator
        rule %r/operator +const +sc_unsigned\&/, Operator
        rule %r/operator +uint64/, Operator
        rule %r/operator +double/, Operator
        rule %r/operator +unsigned +int/, Operator
        rule %r/operator +sc_unsigned/, Operator
        rule %r/operator\&\=|operator\|\=|operator\^\=|operator\&\=/, Operator
        rule %r/operator\&|operator\||operator~/, Operator
        rule %r/operator\+\+|operator\-\-|operator\,/, Operator
        rule %r/operator\=|operator\=\=|operator\!\=/, Operator
        rule %r/operator\<|operator\>|operator\!/, Operator
        rule %r/operator\<\=|operator\>\=|operator\+\=/, Operator
        rule %r/operator\=\=|operator\*\=|operator\/\=|operator\%\=/, Operator
        rule %r/tlm_phase_\#\#name_arg/, Keyword

        # check on method name, not variable
        # TODO check for other names where method and variable overlaps
        rule %r/(pos\(|bind\(|reset\()/ do |m|
          name = m[0]
          a = name.slice(0,name.length-1)
          b = name.slice(name.length-1,name.length)
          token Name::Function, a
          token Name, b
        end

        # predefined keywords
        rule id do |m|
          name = m[0]

          if self.class.keywords.include? name
            token Keyword
          elsif self.class.keywords_enum.include? name
            token Keyword
          elsif self.class.keywords_type.include? name
            token Keyword
          elsif self.class.constants.include? name
            token Keyword
          elsif self.class.name_function.include? name
            token Name::Function
          elsif self.class.name_class.include? name
            token Name::Class
          elsif self.class.name_class_daggered.include? name
            token Name::Builtin
          elsif self.class.reserved.include? name
            token Keyword::Reserved
          elsif self.class.builtins.include? name
            token Name::Builtin
          else
            token Name
          end
        end
      end

      state :root do
        mixin :expr_whitespace
        mixin :statements
      end

      state :string do
        rule %r/"/, Str, :pop!
        rule %r/\\([\\abfnrtv"']|x[a-fA-F0-9]{2,4}|[0-7]{1,3})/, Str::Escape
        rule %r/[^\\"\n]+/, Str
        rule %r/\\\n/, Str
        rule %r/\\/, Str # stray backslash
      end

      state :macro do
        mixin :include
        rule %r([^/\n\\]+), Comment::Preproc
        rule %r/\\./m, Comment::Preproc
        mixin :inline_whitespace
        rule %r(/), Comment::Preproc
        # NB: pop! goes back to :bol
        rule %r/\n/, Comment::Preproc, :pop!
      end

      state :include do
        rule %r/(include)(\s*)(<[^>]+>)([^\n]*)/ do
          groups Comment::Preproc, Text, Comment::PreprocFile, Comment::Single
        end
        rule %r/(include)(\s*)("[^"]+")([^\n]*)/ do
          groups Comment::Preproc, Text, Comment::PreprocFile, Comment::Single
        end
      end

      state :if_0 do
        # NB: no \b here, to cover #ifdef and #ifndef
        rule %r/^\s*#if/, Comment, :if_0
        rule %r/^\s*#\s*el(?:se|if)/, Comment, :pop!
        rule %r/^\s*#\s*endif\b.*?(?<!\\)\n/m, Comment, :pop!
        rule %r/.*?\n/, Comment
      end
    end
  end
end
