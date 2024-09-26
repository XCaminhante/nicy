prio_io_rt_lowest; prio_cpu_secondary; apply_rule $(appclass_web_browser)
prio_io_rt_normal; prio_cpu_interactive; apply_rule $(appclass_music_player)
prio_io_rt_normal; prio_cpu_interactive; apply_rule $(appclass_video_player)
prio_io_secondary_greedy; prio_cpu_secondary; apply_rule $(appclass_chat)
prio_io_interactive; prio_cpu_secondary; apply_rule $(appclass_p2p_client)
prio_io_interactive; prio_cpu_secondary; apply_rule $(appclass_document_editor)
prio_io_interactive; prio_cpu_secondary; apply_rule $(appclass_document_viewer)

prio_io_user_batch; prio_cpu_interactive; apply_rule $(appclass_terminal)
prio_io_interactive; prio_cpu_interactive_important; apply_rule $(appclass_user_daemon)
prio_io_interactive_important; prio_cpu_interactive_important; apply_rule $(appclass_DEWM)
prio_io_user_batch; prio_cpu_user_batch; apply_rule $(appclass_user_batch)
prio_io_user_batch; prio_cpu_idle; apply_rule $(appclass_archiver)

prio_io_latency_sensitive; prio_cpu_latency_sensitive; apply_rule $(appclass_tty)
prio_io_latency_sensitive; prio_cpu_latency_sensitive; apply_rule $(appclass_video_server)
prio_io_latency_sensitive; prio_cpu_latency_sensitive; apply_rule $(appclass_audio_server)

prio_io_system_batch; prio_cpu_system_batch; apply_rule $(appclass_system_batch)
prio_io_system_daemon; prio_cpu_system_daemon; apply_rule $(appclass_system_daemon)
prio_io_idle; prio_cpu_idle; apply_rule $(appclass_package_manager)
#prio_io_idle; prio_cpu_idle; apply_rule $(appclass_compiler)
prio_io_secondary_greedy; prio_cpu_user_batch; apply_rule $(appclass_compiler)

