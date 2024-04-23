{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    systemd.enable = true;
    xwayland = {
      enable = true;
    };

    extraConfig = ''
      monitor=,preferred,auto,auto

      exec-once = waybar & swww init & swww clear 191724

      env = XCURSOR_SIZE,24
      env = WLR_NO_HARDWARE_CURSORS,1

      input {
          kb_layout = fr
          kb_variant = azerty
          left_handed = true
          follow_mouse = 1
          natural_scroll = yes
          sensitivity = 0
      }

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          gaps_in = 10
          gaps_out = 20
          border_size = 3
          col.active_border = rgb(ffffff)
          col.inactive_border = rgba(ffffffaa)

          layout = dwindle
      }

       decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          rounding = 4
          blur {
              enabled = yes
              size = 5
              passes = 2
          }
       }

      animations {
          enabled = yes

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic-mouse-v1 {
          sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, N, exec, alacritty
      bind = $mainMod, Q, killactive, 
      bind = $mainMod, F, fullscreen, 1 
      bind = $mainMod SHIFT, F, fullscreen, 0 
      bind = $mainMod SHIFT, M, exec, shutdown now
      bind = $mainMod, space, exec, wofi --show=drun
      bind = $mainMod, V, togglefloating, 
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, ampersand, workspace, 1
      bind = $mainMod, eacute, workspace, 2
      bind = $mainMod, quotedbl, workspace, 3
      bind = $mainMod, apostrophe, workspace, 4
      bind = $mainMod, parenleft, workspace, 5
      bind = $mainMod, minus, workspace, 6
      bind = $mainMod, egrave, workspace, 7
      bind = $mainMod, underscore, workspace, 8
      bind = $mainMod, ccedilla, workspace, 9
      bind = $mainMod, agrave, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, ampersand, movetoworkspace, 1
      bind = $mainMod SHIFT, eacute, movetoworkspace, 2
      bind = $mainMod SHIFT, quotedbl, movetoworkspace, 3
      bind = $mainMod SHIFT, apostrophe, movetoworkspace, 4
      bind = $mainMod SHIFT, parenleft, movetoworkspace, 5
      bind = $mainMod SHIFT, minus, movetoworkspace, 6
      bind = $mainMod SHIFT, egrave, movetoworkspace, 7
      bind = $mainMod SHIFT, underscore, movetoworkspace, 8
      bind = $mainMod SHIFT, ccedilla, movetoworkspace, 9
      bind = $mainMod SHIFT, agrave, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow    
    '';
  };
}
