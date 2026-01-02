export const NotificationPlugin = async ({ project, client, $, directory, worktree }) => {
  return {
    event: async ({ event }) => {
      // Send notification on session completion
      if (event.type === "session.idle") {
        await $`osascript -e 'display notification "Session completed!" with title "opencode"'`
			}
			if (event.type === "permission.updated") {
        await $`osascript -e 'display notification "Permission required to run!" with title "opencode"'`
			}
    }
  }
}
