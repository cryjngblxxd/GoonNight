--[[
    Things to keep in mind :

    keycodes (Keyboard Option): https://create.roblox.com/docs/reference/engine/enums/KeyCode
    input types (Mouse Option) : https://create.roblox.com/docs/reference/engine/enums/UserInputType
    all skin names ( for voidfalls ) : https://pastebin.com/raw/AWF9rJ6W

    script is currently in beta,
    you may encounter issues
    report issues in the server

    functions:
        fov :
            'Global' means the silent uses the same size-system as any other silent
            'Normal' means the silent uses 1:1 very precise sizing
        Performance Mode:
            'ActiveGun' means silent is only enabled if you're holding a tool


    about 0 delay:
        turn custom y-axis off.

    not recommended:
        'Mouse' mode for AimAssist
        3d-Box

    mapping:
        for 'Gun Specification' and 'Inventory Sorter' and 'Custom Bullet Spread' you
        can use your own gun's by using the names below:
            'Double Barrel', 'Revolver', 'Tactical Shotgun', 'Shotgun', 'Drum Shotgun'
            'Glock', 'Silencer', 'Usp', 'Knife', 'Katana', 'Chicken', 'Pizza', 'Cranberry'
            'Cookie', 'Lettuce', 'Hamburger', 'Starbucks', 'Taco', 'Lemonade', 'Popcorn'
            'Donut, 'HotDog', 'Milk', 'Meat'

            these values are custom made so that it can support every game, if something
            doesn't work in a specific game send the game in bug reports with the gun name

    Crashes:
        crashing? put a webhook inside of Settings > Webhook to get reason
        if nothing was sent there report it as a bug

    Web Configs:
	web configs arent working for you this reason is due to the fact the website is not up as of current 
	it will NOT work for the current time being.

    
]]

getgenv()['GoonNight'] = {

    ['Script Key'] = { "" };

    ['Settings'] = {
        ['Webhook'] = "YOUR_WEBHOOK_HERE";
        ['Web Configs'] = true; --[[ Will use your configs from the website dashboard ]]
        ['Intro'] = true; --[[ plays the intro on load ]]
        ['Notifications'] = { --[[ shared look for every ['Notification'] block ]]
            ['Icon'] = 83752373575368; --[[ any asset id, 0 = the downloaded logo ]]
            ['Accent'] = {96, 120, 190};
        };

        ['Hotkeys'] = { --[[ the on-screen toggle panel - white dot = enabled ]]
            ['Enabled'] = true;
            ['Show'] = {
                ['Silent Aim'] = true;
                ['Aim Assist'] = true;
                ['TriggerBot'] = true;
                ['Anti Curve'] = true;
                ['Resolver'] = true;
                ['Auto Buy'] = true;
            };
        };

        ['Performance Mode'] = {
            ['Enabled'] = true;
            ['Processing'] = true;
            ['ActiveGun'] = true;
        };
    };

    ['Silent Aim'] = {
        ['Enabled'] = true;
        ['Set As Aim Assist Target'] = false; -- [[ sets the silent aim target to player ]]
        ['HitChance'] = {false, 100};
        ['Prediction'] = {
            ['Enabled'] = true;
            ['Auto Prediction'] = false; --[[ Auto prediction for those who cant make sets ]]
            ['Value'] = 0.12977565321; --[[ ignore if you're using Auto Prediction ]]
        };

        ['Anti Aim Viewer'] = {
            ['Enabled'] = true;

            --[[
                Only used on Void Fall games (Da Strike / Uphill / Downhill /
                Bank / Aim Trainer). Every other game has a mouse value to write
                to, so it always replicates the honest position and ignores this.

                'Simple' - our own calls pass straight through, only the game's
                           calls get rewritten to the real position. The shot
                           fires the predicted point directly.

                'Custom' - every call goes through the hook. Predicted while
                           shooting, real otherwise.
            ]]
            ['VoidFall Method'] = 'Custom' --[[ 'Simple' or 'Custom' ]];
            ['Shoot Window'] = 0.3 --[[ 'Custom' only: seconds of predicted after a shot ]];
        };

        ['Labels'] = { --[[ the [ Anti Curve ] / [ Resolver ] style status text ]]
            ['Enabled'] = true;
            ['Anchor'] = 'Mouse' --[[ 'Mouse' = under your cursor, 'Center' = center of screen ]];
            ['Offset'] = 120 --[[ pixels below the anchor ]];
            ['Header Color'] = {188, 188, 188};
            ['Body Color'] = {160, 160, 160};
        };

        ['Target'] = {
            ['BasePart'] = 'UpperTorso';
            ['Closest'] = {
                ['Enabled'] = true;
                ['Raycast'] = false --[[ ignores Reduce and gives 1:1 position when mouse on target ]];
                ['Method'] = 'Point' --[[ 'Part' or 'Point']];
                ['Axis'] = 'Center' --[[ ('Center' = only y-axis) ('All' = xyz-axis) ]];
                ['Sharpness'] = 1 --[[Sharpness (1 = max) (0.5 = mid) (0.01 = slowest)]];
                ['Reduce'] = { --[[ how far from the edge do you want the point to stay (0 means it’ll stick to edges) ]]
                    ['Center'] = 0.45;
                    ['All'] = 0.7;
                }
            };
        };

        ['Toggle'] = { --[[ this will turn your silent on or off ]]
            ['Enabled'] = true;
            ['Need Holding'] = false;
            ['Input'] = {'P', 'MouseButton2', ('Keyboard'--[['Keyboard', 'Mouse']])};

            ['Notification'] = {
                ['Enabled'] = true;  --[[ turn this off if you only want sound ]]
                ['Sound'] = true;
                ['Duration'] = 1;
                ['Volume'] = 0.5;
                ['Color'] = {188, 188, 188};
                ['Position'] = 'middleleft' --[[ 'topcenter', 'belowmiddle', 'topleft', 'topright', 'cornerleft', 'cornerright', 'middleleft', 'middleright' ]];
                ['Sound Id'] = {112910579737497, 4064874742} --[[ Enabled Sound, Disabled Sound ]]
            }
        };

        ['Keybind Mode'] = { --[[ you will have to toggle silent aim by using a keybind  ]]
            ['Enabled'] = false;
            ['Need Holding'] = false;
            ['Unlock Mode'] = 'Repeat'; --[[ ('Normal' = lock/unlock) ('Repeat' = only unlocks if outside of all boxs) ]]
            ['Input'] = {'T', 'MouseButton2', ('Keyboard'--[['Keyboard', 'Mouse']])};

            ['Notification'] = {
                ['Enabled'] = true;
                ['Duration'] = 1;
                ['Color'] = {188, 188, 188};
                ['Position'] = 'middleleft' --[[ 'topcenter', 'belowmiddle', 'topleft', 'topright', 'cornerleft', 'cornerright', 'middleleft', 'middleright' ]];
            }
        };

        ['Fov'] = {
            ['Mode'] = '2d-Circle' --[[ '2d-Box', '3d-Box', '2d-Circle' ]];

            ['2d-Circle'] = {
                ['Visible'] = true;
                ['Size'] = {100, 'Global' --[[ ('Normal' uses very precise) ('Global' uses same as all other fov's) ]]};
                ['Transparency'] = 0.6 --[[ 0 = solid, 1 = invisible ]];
                ['Thickness'] = 2;
                ['Outline Color'] = {0, 0, 0};
                ['Follow'] = 'Smooth' --[[ 'Smooth' or 'Instant' ]];
                ['Smoothness'] = 0.15 --[[ ignore if Follow is 'Instant' ]];
                ['Gradient'] = {
                    ['Top'] = {0, 9, 139};
                    ['Bottom'] = {255, 255, 255};
                    ['Rotation'] = 90;
                    ['Rotation Speed'] = 9 --[[ 0 = static ]];
                };
                ['Text Information'] = { --[[ the target card: avatar, name, @user, hp bar w/ hit pulse ]]
                    ['Target'] = true; --[[ pops the card while you have a target ]]
                    ['Stick To Target'] = false; --[[ true = the card follows the target in the world ]]
                };
            };

            ['2d-Box'] = {
                ['Visibility'] = 'Only Targetting'--[[ 'Always on', 'Only Targetting', 'Never']];
                ['Targetting Color'] = {3, 252, 111};
                ['Size'] = { ['Width'] = 1, ['Height'] = 2 } --[[ scaled off the target's on-screen height ]];
                ['Thickness'] = 3;
            };

            ['Tracer'] = { --[[ line from your cursor to the target ]]
                ['Enabled'] = true;
                ['Thickness'] = 1;
                ['Color'] = {3, 252, 111};
            };

            ['3d-Box'] = {
                ['Transparency'] = 0.7;
                ['Material'] = 'SmoothPlastic';
                ['Color'] = {129, 247, 140};
                ['Size'] = {
                    ['X'] = 4;
                    ['Y'] = 6;
                    ['Z'] = 2;
                };
            };

            ['HighLight'] = {
                ['Enabled'] = true;
                ['Color'] = { {161, 166, 190}, {188, 188, 188} };
                ['Transparency'] = { 0.4, 0 };
            };
        };

        ['Checks'] = {
            ['Anti Ground Shots'] = true;
            ['Visibility'] = true;
            ['Knocked'] = true;
            ['Unlock If Knocked'] = true; --[[ feature stays off while YOU are knocked, back when you're up ]]
            ['Crew Check'] = false;
            ['ForceField'] = true;
            ['Grabbed'] = true;
        };

        ['Anti Curve'] = {
            ['Enabled'] = false;
            ['Use Keybind'] = false; --[[ lets you turn anti curve on/off with the key below ]]
            ['Keybind'] = 'P';
            ['Debug Output'] = false; --[[ prints the output in console ]]
            ['Use Closest Point'] = true; --[[ hardly recommended ]]
            ['Method'] = '3d-Angles'; --[[ '3d-Angles', 'Pixels', '1:1']]
            ['Angles'] = {
                ['Max'] = 2.2;
                ['Dynamic Distance'] = {
                    ['Enabled'] = false;
                    ['Distance'] = 15;
                    ['Min - Max'] = {2.2, 8}
                };
            };

            --[[
                3d-Angles:
                    Checks whether your aim has “curved” too much toward the target in 3D space.
                    ['Max'] = 2.2; this is the max distance between ur mosue and the target-
                    position (if over = won't redirect)

                    ['Dynamic Distance'] = once youre ['Distance'] = 15; amount close to target -
                    it will start doing min to max like if ur 10 then its 0.42 5 = 0.65

                'Pixels':
                    Checks whether your aim has “curved” too much toward the target in 3D space-
                    using pixels

                '1:1':
                    Checks if your aim is on the target or not, if it is then it redirects-
                    otherwise if it isn't it wont redirect.
                        
            ]]
        };
    };

    ['Aim Assist'] = {
        ['Enabled'] = true;
        ['Follow Mode'] = 'Camera' --[['Camera', 'Mouse']];
        ['Smoothness'] = {true, 0.025};
        ['Prediction'] = {
            ['Enabled'] = true;
            ['Auto Prediction'] = true; --[[ Auto Prediction if you cant make sets ]]
            ['Value'] = 0.128; --[[ ignore if you're using Auto Prediction ]]
        };

        ['Target'] = {
            ['BasePart'] = 'UpperTorso';
            ['Closest'] = {
                ['Enabled'] = true;
                ['Raycast'] = false --[[ ignores Reduce and gives 1:1 position when mouse on target ]];
                ['Method'] = 'Point' --[[ 'Part' or 'Point']];
                ['Axis'] = 'All' --[[ ('Center' = only y-axis) ('All' = xyz-axis) ]];
                ['Sharpness'] = 1 --[[Sharpness (1 = max) (0.5 = mid) (0.01 = slowest)]];
                ['Reduce'] = { --[[ how far from the edge do you want the point to stay (0 means it’ll stick to edges) ]]
                    ['Center'] = 0.45;
                    ['All'] = 0.7;
                }
            };
        };

        ['Keybind Mode'] = { --[[ using aim assist you will need to toggle it wont auto lock on ]]
            ['Enabled'] = true;
            ['Need Holding'] = false;
            ['Input'] = {'Q', 'MouseButton2', ('Keyboard'--[['Keyboard', 'Mouse']])};

            ['Notification'] = {
                ['Enabled'] = true;
                ['Duration'] = 1;
                ['Color'] = {188, 188, 188};
                ['Position'] = 'middleleft' --[[ 'topcenter', 'belowmiddle', 'topleft', 'topright', 'cornerleft', 'cornerright', 'middleleft', 'middleright' ]];
            }
        };

        ['Toggle'] = { --[[ this will turn your aimassist on or off ]]
            ['Enabled'] = true;
            ['Need Holding'] = false;
            ['Input'] = {'M', 'MouseButton2', ('Keyboard'--[['Keyboard', 'Mouse']])};

            ['Notification'] = {
                ['Enabled'] = true;  --[[ turn this off if you only want sound ]]
                ['Sound'] = true;
                ['Duration'] = 1;
                ['Volume'] = 0.5;
                ['Color'] = {188, 188, 188};
                ['Position'] = 'middleleft' --[[ 'topcenter', 'belowmiddle', 'topleft', 'topright', 'cornerleft', 'cornerright', 'middleleft', 'middleright' ]];
                ['Sound Id'] = {112910579737497, 4064874742} --[[ Enabled Sound, Disabled Sound ]]
            }
        };

        ['Fov'] = {
            ['Mode'] = '2d-Circle';

            ['2d-Circle'] = {
                ['Visible'] = false;
                ['Size'] = {170, 'Global' --[[ ('Normal' uses very precise) ('Global' uses same as all other fov's) ]]};
                ['Transparency'] = 0.8;
                ['Thickness'] = 2;
                ['Outline Color'] = {0, 0, 0};
                ['Follow'] = 'Smooth' --[[ 'Smooth' or 'Instant' ]];
                ['Smoothness'] = 0.15;
                ['Gradient'] = {
                    ['Top'] = {172, 193, 232};
                    ['Bottom'] = {255, 255, 255};
                    ['Rotation'] = 90;
                    ['Rotation Speed'] = 9;
                };
            };

            ['HighLight'] = {
                ['Enabled'] = false;
                ['Color'] = { {161, 166, 190}, {172, 193, 232} };
                ['Transparency'] = { 0.4, 0 };
            };
        };

        ['Checks'] = {
            ['First Person'] = true;
            ['Third Person'] = true;
            ['Visibility'] = true;
            ['Knocked'] = true;
            ['Unlock If Knocked'] = true; --[[ feature stays off while YOU are knocked, back when you're up ]]
            ['Crew Check'] = false;
            ['ForceField'] = true;
            ['Grabbed'] = true;
        };

        ['EasingStyle'] = {
            ['Position'] = {
                ['In'] = 'Quart';
                ['Out'] = 'Quart';
            };

            ['Rotation'] = {
                ['In'] = 'Sine';
                ['Out'] = 'Linear';
            };
        };

        ['Apply Shake'] = {
            ['Enabled'] = false;
            ['Randomized'] = false;
            ['Axis'] = {15, 15, 15};
        };
    };

    ['Resolver'] = {
        ['Enabled'] = true;
        ['Powerup'] = false --[[ use only if you need to resolve something crazy ]];
        ['Method'] = 'Detection' --[['Detection', 'TrueVelocity']];
    };

    ['Auto Prediction'] = {
        --[[
            This is the section for auto predicition if you dont understand this 
	    you have bigger issues to worry about than cheating in dh games or ripoffs.
        ]]
        ['p0_10'] = 0.10291; ['p10_20'] = 0.11426215; ['p20_30'] = 0.12324307; ['p30_40'] = 0.12332321;
        ['p40_50'] = 0.12977643291; ['p50_60'] = 0.13462285; ['p60_70'] = 0.1363253; ['p70_80'] = 0.1440221;
        ['p80_90'] = 0.14978255627; ['p90_100'] = 0.14978255627;
        ['p100_110'] = 0.1603; ['p110_120'] = 0.1602; ['p120_130'] = 0.1534125;
        ['p130_140'] = 0.15; ['p140_150'] = 0.1555; ['p150_160'] = 0.1574;
        ['p160_170'] = 0.1663; ['p170_180'] = 0.1672; ['p180_190'] = 0.1848; ['p190_200'] = 0.1865;
    };


    ['Endmath Modifier'] = {
        ['Velocity History'] = true; --[[ Records velocity history and gives better prediction ]]

        ['Custom Y-Axis'] = {
            ['Enabled'] = false; --[[ off = plain Position + Velocity * Prediction on every axis ]]
            ['Prediction'] = 0.08977565321; --[[ vertical lead uses its own smaller value ]]
            ['Falling Offset'] = 0.25;
            ['Jumping Offset'] = 0;
            ['Allowed'] = {
                ['Silent Aim'] = true;
                ['Aim Assist'] = true;
            }

            --[[
                Custom Y-Axis lets you adjust your aim for more accurate shots, including in mid-air.

                - When the target is falling, the prediction point is multiplied by ['Falling Offset'].
                - When the target is jumping, the prediction point is multiplied by ['Jumping Offset'].

                Essentially, it modifies the target's current Y position: 
                    Example: 
                        100 * 0.3 = 30   (aims lower)
                        100 * 1.1 = 110  (aims higher)

                    [ default is 1 ]
            ]]
        };

    };

    ['TriggerBot'] = {
        ['Enabled'] = true;
        ['Sync With Camlock'] = false; --[[ uses the camlock's (aim assist) prediction instead of the one below ]]
        ['Prediction'] = {
            ['Value'] = 0.132;
        };
        ['Limits'] = {
            ['Target Only'] = {  -- [[ shoots when silent aim target and triggerbot target are in sync ]]
                ['Enabled'] = false;
                ['Mode'] = 'Silent Aim'; --[[ 'Silent Aim', 'Aim Assist' ]]
            };
        };
        ['Fov'] = {
            ['Enabled'] = true --[[ this will determine if you wan't to use fov or normal character ]];

            ['2d-Box'] = {
                ['Visibility'] = 'Only Targetting'--[[ 'Always on', 'Only Targetting', 'Never']];
                ['Targetting Color'] = {52, 198, 235};
                ['Size'] = { ['Width'] = 1, ['Height'] = 2 };
                ['Thickness'] = 3;
            };
        };
        ['Delay'] = {
            ['Enabled'] = true;
            ['Normal'] = 0.1;
            ['Randomized'] = {true, 0.1, 0.12}
        };
        ['Toggle'] = {
            ['Enabled'] = true;  --[[ turn this off if you only want sound ]]
            ['Need Holding'] = false;
            ['Input'] = {'J', 'MouseButton2', ('Keyboard'--[['Keyboard', 'Mouse']])};

            ['Notification'] = {
                ['Enabled'] = true;
                ['Sound'] = true;
                ['Duration'] = 1;
                ['Volume'] = 0.5;
                ['Color'] = {188, 188, 188};
                ['Position'] = 'middleleft' --[[ 'topcenter', 'belowmiddle', 'topleft', 'topright', 'cornerleft', 'cornerright', 'middleleft', 'middleright' ]];
                ['Sound Id'] = {112910579737497, 4064874742} --[[ Enabled Sound, Disabled Sound ]]
            }
        };
        ['Checks'] = {
            ['Visibility'] = true;
            ['Tools'] = true;
            ['Knife'] = true;
            ['Katana'] = true;
            ['Alive'] = true;
            ['Knocked'] = true;
            ['Unlock If Knocked'] = true; --[[ feature stays off while YOU are knocked, back when you're up ]]
            ['Wallet'] = true;
        };

        ['Gun Specification'] = {
            --[[
                Using this you can change prediction, delay and fov
		suitable for all :
                    ['Prediction'] -- triggerbot prediction for this band
                    ['Delay']      -- triggerbot delay for this band
                    ['Code']       -- optional function for anything else
                A band can also just be a function like the main one.
            ]]
            ['Enabled'] = false;
            ['Ranges'] = { ['Close'] = 20; ['Mid'] = 40; ['Far'] = 60; };

            ['Double Barrel'] = {
                ['Close'] = { ['Prediction'] = 0.125; ['Delay'] = 0.08; };
                ['Mid']   = { ['Prediction'] = 0.132; ['Delay'] = 0.1; };
                ['Far']   = { ['Prediction'] = 0.14; ['Delay'] = 0.12; };
            };
        };
    };

    ['Miscellaneous'] = {
        ['Anti Afk'] = true;
        ['Anti Fling'] = true;

        ['Inventory Sorter'] =  {
            ['Enabled'] = false;
            ['Hide Junk'] = true --[[ puts non-listed items in inventory ]];
            ['Activation Key'] = {
                ['Input'] = {'H', 'MouseButton2', ('Keyboard'--[['Keyboard', 'Mouse']])};
            };
            ['Slots'] = {
                [1] = 'Revolver';
                [2] = 'Double Barrel';
                [3] = 'Tactical Shotgun';
                [4] = 'Shotgun';
                [5] = 'Knife';
                [6] = 'Katana';
                [7] = 'Chicken';
                [8] = 'Pizza';
                [9] = 'Cranberry'
            };
        };
    };

    ['Prefire'] = {
        --[[
	    shoots when someone shoots near you.
            Useful feature for star tryouts if the tryout person/shooter shoots near, you will shoot instantly
	    making you shoot your opponent  before they can even react. ['Range'] only applies on void fall games.
        ]]
        ['Enabled'] = true;
        ['Range'] = 100; --[[ shooter must be within this many studs (void fall only) ]]
        ['Delay'] = 0.02;
        ['Keybind'] = {
            ['Input'] = { 'V', 'C', 'MouseButton2' }; --[[ holding any of these arms prefire ]]
        };
    };

    ['Rapid Fire'] = {
        --[[
            Legit rapid fire - hold down m1 and you will empty your mag (your cursor doesnt need to be on them).
        ]]
        ['Enabled'] = false;
        ['Delay'] = 0; --[[ seconds between shots while holding, keep 0 for fastest ]]
    };

    ['Skin Changer'] = {
        --[[
            Void fall games ONLY 
        ]]
        ['Enabled'] = false;
        ['Skin'] = 'galaxy';
    };

    ['Auto Buy'] = {
        --[[
            Buys from shop pads around you automatically. Void fall games don't
            check how far you are from the pad, so ['BuyDistance'] works as-is
            - buy from across the map if you want. Every other game patched
            long-range buying, so the distance is capped at 5 studs there.
        ]]
        ['Enabled'] = true;
        ['BuyDistance'] = 50;
        ['Cooldown'] = 0; --[[ seconds to wait after buying one item - 0 buys everything in range at once ]]
        

        ['Ignore Specific'] = {
            --[[
                Skips exact pads by name. You need the EXACT item name as it
                shows on the pad - if something still gets bought you either
                typed the name wrong or we did; notify staff for any issues
                since this is a new option.
            ]]
            ['Enabled'] = false;
            ['Items'] = { 'Taco', 'High Armor' };
        };

        ['Buy Only Specific'] = {
            --[[
                You buy specific items under what ever names you desire
		auto buying whilst having this one wont work as it was
		stated about 8 lines above. 
            ]]
            ['Enabled'] = false;
            ['Items'] = { 'Revolver', 'Full Armor' };
        };
        ['WorkOnlyOnKeybind'] = true; --[[ only buy while the keybind is held ]]
        ['Keybind'] = 'V';
    };

    ['0-delay'] = { --{ these only work on the games that use 0 delay }--
        ['Hitbox Modifier'] = {
            ['Enabled'] = false;
            ['Transparency'] = 1;
            ['Size'] = {15, 15, 15};
            ['Color'] = {218, 196, 255};
            ['Visualizer Settings'] = {
                ['Enabled'] = true;
                ['Color'] = { {218, 196, 255}, {225, 225, 225} };
                ['Transparency'] = { 0.6, 0 };
            }
        };

        ['Custom Bullet Spread'] = {
            --[[
                if there is a gun that it doesn't work on
                or a gun that isn't listed below then
                send the games link and the name of the gun
                like "shotgun" or "db" in bugs channel
            --]]

            ['Enabled'] = true;
            ['Method'] = 'Percentage'; --[[ 'Percentage' or 'Custom']]
            ['Double Barrel'] = {
                ['Percentage'] = 75;
                ['x'] = {{0.5, 0.03, 0.03}, {0.5, 0.005, 0.015}};
                ['y'] = {{0.5, 0.06, 0.06}, {0.5, 0.03, 0.03}};
                ['z'] = {{0.5, 0.03, 0.03}, {0.5, 0.015, 0.015}};
            };
            ['Tactical Shotgun'] = {
                ['Percentage'] = 75;
                ['x'] = {{0.5, 0.03, 0.03}, {0.5, 0.005, 0.015}};
                ['y'] = {{0.5, 0.06, 0.06}, {0.5, 0.03, 0.03}};
                ['z'] = {{0.5, 0.03, 0.03}, {0.5, 0.015, 0.015}};
            };
            ['Shotgun'] = {
                ['Percentage'] = 75;
                ['x'] = {{0.5, 0.03, 0.03}, {0.5, 0.005, 0.015}};
                ['y'] = {{0.5, 0.06, 0.06}, {0.5, 0.03, 0.03}};
                ['z'] = {{0.5, 0.03, 0.03}, {0.5, 0.015, 0.015}};
            };
            ['Drum Shotgun'] = {
                ['Percentage'] = 75;
                ['x'] = {{0.5, 0.03, 0.03}, {0.5, 0.005, 0.015}};
                ['y'] = {{0.5, 0.06, 0.06}, {0.5, 0.03, 0.03}};
                ['z'] = {{0.5, 0.03, 0.03}, {0.5, 0.015, 0.015}};
            };
            ['Other'] = {
                ['Percentage'] = 0;
                ['x'] = {{0, 0, 0}, {0, 0, 0}};
                ['y'] = {{0, 0, 0}, {0, 0, 0}};
                ['z'] = {{0, 0, 0}, {0, 0, 0}};
            };
        };
    };

    ['Gun Specification'] = {
        --[[
            HOW THIS WORKS - checks distance via studs dependable on each gun
			     giving its own unique attributes for example (20 studs).

            While you're holding a listed gun and have a target, the script
            checks how far the target is (studs between you and them):
                Close = within ['Close'] studs (20 by default)
                Mid   = within ['Mid'] studs
                Far   = within ['Far'] studs

            NOTE: if you're dumb don't bother configurating this - leaving
            the functions empty does nothing and that's fine.
        ]]

        ['Enabled'] = false;
        ['Range'] = {
            ['Enabled'] = true; --[[ if this is false it will only use ['Close'] ]]
            ['Target'] = 'Silent Aim'; --[[ 'Silent Aim' or 'Aim Assist' ]]
            ['Ranges'] = { ['Close'] = 20; ['Mid'] = 40; ['Far'] = 60; };
        };

        ['Revolver'] = {
            --[[
                FULL example with every key filled in, modify it however you
                want. Every key is optional, delete the ones you don't need.
            ]]
            ['Close'] = {
                ['Prediction'] = 0.115; --[[ less lead up close ]]
                ['Fov'] = 130; --[[ wider circle so you can flick ]]
                ['Smoothing'] = 0.025; --[[ aim assist smoothness for this band ]]
                ['HitChance'] = 100; --[[ silent aim hit chance % ]]
                ['Code'] = function()
                    --[[ you can add extra things hence the reason for the reason for the 'code' and 'function'
		         IGNORE if you dont understand or just keep it at enabled = false ]]
                end;
            };
            ['Mid'] = {
                ['Prediction'] = 0.12977565321;
                ['Fov'] = 100;
                ['Smoothing'] = 0.025;
                ['HitChance'] = 100;
            };
            ['Far'] = {
                ['Prediction'] = 0.14; --[[ prediction ]]
                ['Fov'] = 90;
                ['Smoothing'] = 0.03;
                ['HitChance'] = 95;
            };
        };

        ['Double Barrel'] = {
            --[[ smaller version ]]
            ['Close'] = { ['Prediction'] = 0.115; ['Fov'] = 130; ['HitChance'] = 100; };
            ['Mid']   = { ['Prediction'] = 0.12977565321; ['Fov'] = 100; };
            ['Far']   = { ['Prediction'] = 0.14; ['Fov'] = 90; ['Smoothing'] = 0.03; };
        };

        ['Tactical Shotgun'] = {
            ['Close'] = function() end;
            ['Mid'] = function() end;
            ['Far'] = function() end;
        };

        ['Shotgun'] = {
            ['Close'] = function() end;
            ['Mid'] = function() end;
            ['Far'] = function() end;
        };

        ['Usp'] = {
            ['Close'] = function() end;
            ['Mid'] = function() end;
            ['Far'] = function() end;
        };

        ['Silencer'] = {
            ['Close'] = function() end;
            ['Mid'] = function() end;
            ['Far'] = function() end;
        };
    }
}
loadstring(game:HttpGet("example"))()
