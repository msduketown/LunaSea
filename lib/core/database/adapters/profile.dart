import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lunasea/core.dart';

part 'profile.g.dart';

@HiveType(typeId: 0, adapterName: 'ProfileHiveObjectAdapter')
class ProfileHiveObject extends HiveObject {
    factory ProfileHiveObject.empty() {
        return ProfileHiveObject(
            //Lidarr
            lidarrEnabled: false,
            lidarrHost: '',
            lidarrKey: '',
            lidarrStrictTLS: true,
            //Radarr
            radarrEnabled: false,
            radarrHost: '',
            radarrKey: '',
            radarrStrictTLS: true,
            //Sonarr
            sonarrEnabled: false,
            sonarrHost: '',
            sonarrKey: '',
            sonarrStrictTLS: true,
            //SABnzbd
            sabnzbdEnabled: false,
            sabnzbdHost: '',
            sabnzbdKey: '',
            sabnzbdStrictTLS: true,
            //NZBGet
            nzbgetEnabled: false,
            nzbgetHost: '',
            nzbgetUser: '',
            nzbgetPass: '',
            nzbgetStrictTLS: true,
        );
    }

    factory ProfileHiveObject.from(ProfileHiveObject obj) {
        return ProfileHiveObject(
            //Lidarr
            lidarrEnabled: obj.lidarrEnabled,
            lidarrHost: obj.lidarrHost,
            lidarrKey: obj.lidarrKey,
            lidarrStrictTLS: obj.lidarrStrictTLS,
            //Radarr
            radarrEnabled: obj.radarrEnabled,
            radarrHost: obj.radarrHost,
            radarrKey: obj.radarrKey,
            radarrStrictTLS: obj.radarrStrictTLS,
            //Sonarr
            sonarrEnabled: obj.sonarrEnabled,
            sonarrHost: obj.sonarrHost,
            sonarrKey: obj.sonarrKey,
            sonarrStrictTLS: obj.sonarrStrictTLS,
            //SABnzbd
            sabnzbdEnabled: obj.sabnzbdEnabled,
            sabnzbdHost: obj.sabnzbdHost,
            sabnzbdKey: obj.sabnzbdKey,
            sabnzbdStrictTLS: obj.sabnzbdStrictTLS,
            //NZBGet
            nzbgetEnabled: obj.nzbgetEnabled,
            nzbgetHost: obj.nzbgetHost,
            nzbgetUser: obj.nzbgetUser,
            nzbgetPass: obj.nzbgetPass,
            nzbgetStrictTLS: obj.nzbgetStrictTLS,
        );
    }

    ProfileHiveObject({
        //Lidarr
        @required this.lidarrEnabled,
        @required this.lidarrHost,
        @required this.lidarrKey,
        @required this.lidarrStrictTLS,
        //Radarr
        @required this.radarrEnabled,
        @required this.radarrHost,
        @required this.radarrKey,
        @required this.radarrStrictTLS,
        //Sonarr
        @required this.sonarrEnabled,
        @required this.sonarrHost,
        @required this.sonarrKey,
        @required this.sonarrStrictTLS,
        //SABnzbd
        @required this.sabnzbdEnabled,
        @required this.sabnzbdHost,
        @required this.sabnzbdKey,
        @required this.sabnzbdStrictTLS,
        //NZBGet
        @required this.nzbgetEnabled,
        @required this.nzbgetHost,
        @required this.nzbgetUser,
        @required this.nzbgetPass,
        @required this.nzbgetStrictTLS,
    });

    @override
    String toString() {
        return toMap().toString();
    }

    Map<String, dynamic> toMap() {
        return {
            "key": key,
            //Sonarr
            "sonarrEnabled": sonarrEnabled,
            "sonarrHost": sonarrHost,
            "sonarrKey": sonarrKey,
            "sonarrStrictTLS": sonarrStrictTLS,
            //Radarr
            "radarrEnabled": radarrEnabled,
            "radarrHost": radarrHost,
            "radarrKey": radarrKey,
            "radarrStrictTLS": radarrStrictTLS,
            //Lidarr
            "lidarrEnabled": lidarrEnabled,
            "lidarrHost": lidarrHost,
            "lidarrKey": lidarrKey,
            "lidarrStrictTLS": lidarrStrictTLS,
            //SABnzbd
            "sabnzbdEnabled": sabnzbdEnabled,
            "sabnzbdHost": sabnzbdHost,
            "sabnzbdKey": sabnzbdKey,
            "sabnzbdStrictTLS": sabnzbdStrictTLS,
            //NZBGet
            "nzbgetEnabled": nzbgetEnabled,
            "nzbgetHost": nzbgetHost,
            "nzbgetUser": nzbgetUser,
            "nzbgetPass": nzbgetPass,
            "nzbgetStrictTLS": nzbgetStrictTLS,
        };
    }

    //Lidarr
    @HiveField(0)
    bool lidarrEnabled;
    @HiveField(1)
    String lidarrHost;
    @HiveField(2)
    String lidarrKey;
    @HiveField(18)
    bool lidarrStrictTLS;

    Map<String, dynamic> getLidarr() => {
        'enabled': lidarrEnabled ?? false,
        'host': lidarrHost ?? '',
        'key': lidarrKey ?? '',
        'strict_tls': lidarrStrictTLS ?? true,
    };

    //Radarr
    @HiveField(3)
    bool radarrEnabled;
    @HiveField(4)
    String radarrHost;
    @HiveField(5)
    String radarrKey;
    @HiveField(17)
    bool radarrStrictTLS;

    Map<String, dynamic> getRadarr() => {
        'enabled': radarrEnabled ?? false,
        'host': radarrHost ?? '',
        'key': radarrKey ?? '',
        'strict_tls': radarrStrictTLS ?? true,
    };

    //Sonarr
    @HiveField(6)
    bool sonarrEnabled;
    @HiveField(7)
    String sonarrHost;
    @HiveField(8)
    String sonarrKey;
    @HiveField(16)
    bool sonarrStrictTLS;

    Map<String, dynamic> getSonarr() => {
        'enabled': sonarrEnabled ?? false,
        'host': sonarrHost ?? '',
        'key': sonarrKey ?? '',
        'strict_tls': sonarrStrictTLS ?? true,
    };

    //SABnzbd
    @HiveField(9)
    bool sabnzbdEnabled;
    @HiveField(10)
    String sabnzbdHost;
    @HiveField(11)
    String sabnzbdKey;
    @HiveField(19)
    bool sabnzbdStrictTLS;
    
    Map<String, dynamic> getSABnzbd() => {
        'enabled': sabnzbdEnabled ?? false,
        'host': sabnzbdHost ?? '',
        'key': sabnzbdKey ?? '',
        'strict_tls': sabnzbdStrictTLS ?? true,
    };

    //NZBGet
    @HiveField(12)
    bool nzbgetEnabled;
    @HiveField(13)
    String nzbgetHost;
    @HiveField(14)
    String nzbgetUser;
    @HiveField(15)
    String nzbgetPass;
    @HiveField(20)
    bool nzbgetStrictTLS;

    Map<String, dynamic> getNZBGet() => {
        'enabled': nzbgetEnabled ?? false,
        'host': nzbgetHost ?? '',
        'user': nzbgetUser ?? '',
        'pass': nzbgetPass ?? '',
        'strict_tls': nzbgetStrictTLS ?? true,
    };

    List<String> get enabledServices => [
        if(ModuleFlags.AUTOMATION && ModuleFlags.LIDARR && lidarrEnabled) 'lidarr',
        if(ModuleFlags.AUTOMATION && ModuleFlags.RADARR && radarrEnabled) 'radarr',
        if(ModuleFlags.AUTOMATION && ModuleFlags.SONARR && sonarrEnabled) 'sonarr',
        if(ModuleFlags.CLIENTS && ModuleFlags.NZBGET && nzbgetEnabled) 'nzbget',
        if(ModuleFlags.CLIENTS && ModuleFlags.SABNZBD && sabnzbdEnabled) 'sabnzbd',
    ];

    List<String> get enabledAutomationServices => [
        if(ModuleFlags.AUTOMATION && ModuleFlags.LIDARR && lidarrEnabled) 'lidarr',
        if(ModuleFlags.AUTOMATION && ModuleFlags.RADARR && radarrEnabled) 'radarr',
        if(ModuleFlags.AUTOMATION && ModuleFlags.SONARR && sonarrEnabled) 'sonarr',
    ];

    List<String> get enabledClientServices => [
        if(ModuleFlags.CLIENTS && ModuleFlags.NZBGET && nzbgetEnabled) 'nzbget',
        if(ModuleFlags.CLIENTS && ModuleFlags.SABNZBD && sabnzbdEnabled) 'sabnzbd',
    ];

    bool get anyAutomationEnabled => lidarrEnabled || radarrEnabled || sonarrEnabled;
    bool get anyClientsEnabled => nzbgetEnabled || sabnzbdEnabled;
    bool get anythingEnabled => anyAutomationEnabled || anyClientsEnabled;
}
