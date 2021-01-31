import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import System.IO
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-------------------------------------------------------------------------------
-- Simple stuff
-------------------------------------------------------------------------------

myWorkspaces    = [ "1",  "2",  "3",  "4",  "8",  "9",  "0"]
myWorkspaceKeys = [xK_1, xK_2, xK_3, xK_4, xK_8, xK_9, xK_0]

-------------------------------------------------------------------------------
-- Key bindings
-------------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    [ ((modMask .|. shiftMask, xK_e     ), io $ exitWith ExitSuccess)  -- FIXME
    , ((modMask,               xK_q     ), kill)
    , ((modMask,               xK_r     ),
            spawn "rm -rf ~/.xmonad; xmonad --recompile; xmonad --restart")

    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp)
    , ((modMask,               xK_m     ), windows W.focusMaster)

    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp)
    , ((modMask .|. shiftMask, xK_m     ), windows W.swapMaster)

    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)

    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    , ((modMask,               xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask,               xK_period), sendMessage (IncMasterN (-1)))

    ]
    ++

    -- mod-[1..9], Switch the current view to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) myWorkspaceKeys
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- mod-{w,e}, Switch to physical/Xinerama screens 1 or 2
    -- mod-shift-{w,e}, Move client to screen 1 or 2
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-------------------------------------------------------------------------------
-- Hooks and Layouts
-------------------------------------------------------------------------------

myManageHook = composeAll
    [ className =? "discord"         --> doShift "9"
    , className =? "Blueman-manager" --> doFloat
    ]

myLayoutHook  = avoidStruts $ layoutHook def
myStartupHook = do { spawn "trayershow" }

-------------------------------------------------------------------------------
-- Status bar
-------------------------------------------------------------------------------

myTagNormal = "#00ccff"
myTagUrgent = "#ff7700"
myTagPad s = s ++ " "
myTagWin s = s ++ "'"

myBar = "xmobar"
myPP = xmobarPP {
    ppCurrent          = xmobarColor myTagNormal "" . myTagWin,
    ppUrgent           = xmobarColor myTagUrgent "" . myTagWin,

    ppVisible          = xmobarColor myTagNormal "" . myTagWin,
    ppVisibleNoWindows = Just $ xmobarColor myTagNormal "" . myTagPad,

    ppHidden           = myTagWin,
    ppHiddenNoWindows  = myTagPad,

    ppSep   = " ",
    ppWsSep = " ",

    ppTitle = xmobarColor myTagNormal "" . (++) " " . shorten 80
}

myToggleBar XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-------------------------------------------------------------------------------
-- Setup
-------------------------------------------------------------------------------

main = xmonad =<< statusBar myBar myPP myToggleBar defaults

defaults = def {
    workspaces    = myWorkspaces,

    keys          = myKeys,

    manageHook    = myManageHook,
    layoutHook    = myLayoutHook,
    startupHook   = myStartupHook
}

-------------------------------------------------------------------------------
