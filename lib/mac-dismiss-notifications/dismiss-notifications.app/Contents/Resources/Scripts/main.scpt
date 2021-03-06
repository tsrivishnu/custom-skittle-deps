JsOsaDAS1.001.00bplist00�Vscript_�function run(input, parameters) {

  const appName = "";
  const verbose = true;

  const notNull = (val) => {
    return val !== null && val !== undefined;
  }

  const isNull = (val) => {
    return !notNull(val);
  }

  const hasAppName = notNull(appName) && appName !== "";
  const appNameForLog = hasAppName ? ` [${appName}]` : "";

  const logs = [];
  const log = (message, ...optionalParams) => {
    let message_with_prefix = `${new Date().toISOString().replaceAll("Z", "").replaceAll("T", " ")} [close_notifications]${appNameForLog} ${message}`;
    console.log(message_with_prefix, optionalParams);
    logs.push(message_with_prefix);
  }

  const logError = (message, ...optionalParams) => {
    log(`ERROR ${message}`, optionalParams);
  }

  const logErrorVerbose = (message, ...optionalParams) => {
    if (verbose) {
      log(`ERROR ${message}`, optionalParams);
    }
  }

  const logVerbose = (message) => {
    if (verbose) {
      log(message);
    }
  }

  const getLogLines = () => {
    return logs.join("\n");
  }

  const getSystemEvents = () => {
    let systemEvents = Application("System Events");
    systemEvents.includeStandardAdditions = true;
    return systemEvents;
  }

  const getNotificationCenter = () => {
    return getSystemEvents().processes.byName("NotificationCenter");
  }

  const getNotificationCenterGroups = () => {
    let notificationCenter = getNotificationCenter();
    if (notificationCenter.windows.length <= 0) {
      return [];
    }
    return notificationCenter.windows[0].uiElements[0].uiElements[0].uiElements();
  }

  const notificationGroupMatches = (group) => {
    if (!hasAppName) {
      return true;
    }

    try {
      for (let elem of group.uiElements()) {
        if (hasAppName && elem.role() === "AXStaticText" && elem.value().toLowerCase() === appName.toLowerCase()) {
          return true;
        }
      }
    } catch (err) {
      logErrorVerbose(`Caught error while checking window, window is probably closed: ${err}`);
      logErrorVerbose(err);
    }
    return false;
  }

  const CLEAR_ALL_ACTION = "Clear All";
  const CLOSE_ACTION = "Close";

  const findCloseAction = (group, closedCount) => {
    try {
      let clearAllAction;
      let closeAction;
      for (let action of group.actions()) {
        if (action.description() === CLEAR_ALL_ACTION) {
          clearAllAction = action;
          break;
        } else if (action.description() === CLOSE_ACTION) {
          closeAction = action;
        }
      }
      if (notNull(clearAllAction)) {
        return clearAllAction;
      } else if (notNull(closeAction)) {
        return closeAction;
      }
    } catch (err) {
      logErrorVerbose(`(group_${closedCount}) Caught error while searching for close action, window is probably closed: ${err}`);
      logErrorVerbose(err);
      return null;
    }
    log("No close action found for notification");
    return null;
  }

  const closeNextGroup = (groups, closedCount) => {
    for (let group of groups) {
      if (notificationGroupMatches(group)) {
        let closeAction = findCloseAction(group, closedCount);

        if (notNull(closeAction)) {
          try {
            closeAction.perform();
            return [true, 1];
          } catch (err) {
            logErrorVerbose(`(group_${closedCount}) Caught error while performing close action, window is probably closed: ${err}`);
            logErrorVerbose(err);
          }
        }
        return [true, 0];
      }
    }
    return false;
  }

  let notificationCenter = getNotificationCenter();
  if (notificationCenter.windows.length <= 0) {
    logError("No notifications found.");
    return getLogLines();
  }

  let groupsCount = getNotificationCenterGroups().filter(group => notificationGroupMatches(group)).length;

  if (groupsCount > 0) {
    logVerbose(`Closing ${groupsCount}${appNameForLog} notification group${(groupsCount > 1 ? "s" : "")}`);

    let closedCount = 0;
    let maybeMore = true;
    while (maybeMore) {
      let closeResult = closeNextGroup(getNotificationCenterGroups(), closedCount);
      maybeMore = closeResult[0];
      if (maybeMore) {
        closedCount = closedCount + closeResult[1];
      }
    }
  } else {
    throw Error(`No${appNameForLog} notifications found...`);
  }

  return getLogLines();
}                              � jscr  ��ޭ