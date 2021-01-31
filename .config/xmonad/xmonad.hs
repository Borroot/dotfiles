import XMonad

import XMonad.Util.Run (spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import System.IO
import System.Exit

import qualified Data.Map as M

-------------------------------------------------------------------------------
-- Simple stuff

--myWorkspaces = ["1", "2", "3", "4", "8", "9", "0"]

-------------------------------------------------------------------------------
-- Key bindings

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask,               xK_r),
            spawn "rm -rf ~/.xmonad; xmonad --recompile; xmonad --restart")

    , ((modMask .|. shiftMask, xK_e),
            io $ exitWith ExitSuccess)

    , ((modMask,               xK_q),
            kill)

    -- TODO add other shortcuts
    ]

-------------------------------------------------------------------------------
-- Hooks and Layouts

myLayoutHook  = avoidStruts $ layoutHook defaultConfig
myStartupHook = do { spawn "trayershow" }

-------------------------------------------------------------------------------
-- Status bar

myBar = "xmobar"
myPP = xmobarPP {
    ppCurrent = xmobarColor "#429942" "" . pad,
    ppHiddenNoWindows = pad
}

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-------------------------------------------------------------------------------
-- Setup

main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults

defaults = def {
    -- Simple stuff
    --workspaces    = myWorkspaces,

    -- Key bindings
    keys          = myKeys,
    --mouseBindings = myMouseBindings,

    -- Hooks and Layouts
    layoutHook    = myLayoutHook,
    startupHook   = myStartupHook
}

-------------------------------------------------------------------------------
