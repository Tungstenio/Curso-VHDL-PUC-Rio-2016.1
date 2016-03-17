<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="S0asd" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_9" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_20" />
        <signal name="XLXN_12" />
        <signal name="XLXN_15" />
        <signal name="XLXN_11" />
        <signal name="XLXN_30" />
        <signal name="XLXN_32" />
        <blockdef name="fadder">
            <timestamp>2016-3-15T12:51:18</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="fadder_4bit">
            <timestamp>2016-3-15T12:54:22</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="416" y2="416" x1="64" />
            <line x2="0" y1="480" y2="480" x1="64" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="256" x="64" y="-192" height="704" />
        </blockdef>
        <block symbolname="fadder_4bit" name="XLXI_2">
            <blockpin name="Cin" />
            <blockpin name="Cout" />
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
            <blockpin name="B0" />
            <blockpin name="B1" />
            <blockpin name="B2" />
            <blockpin name="B3" />
            <blockpin name="S0" />
            <blockpin name="S1" />
            <blockpin name="S2" />
            <blockpin name="S3" />
        </block>
        <block symbolname="fadder" name="XLXI_4">
            <blockpin signalname="XLXN_15" name="A" />
            <blockpin signalname="XLXN_16" name="B" />
            <blockpin signalname="XLXN_1" name="Cin" />
            <blockpin signalname="XLXN_5" name="Sum" />
            <blockpin signalname="XLXN_2" name="Cout" />
        </block>
        <block symbolname="fadder" name="XLXI_5">
            <blockpin signalname="XLXN_17" name="A" />
            <blockpin signalname="XLXN_18" name="B" />
            <blockpin signalname="XLXN_20" name="Cin" />
            <blockpin signalname="S0asd" name="Sum" />
            <blockpin signalname="XLXN_1" name="Cout" />
        </block>
        <block symbolname="fadder" name="XLXI_1">
            <blockpin signalname="XLXN_11" name="A" />
            <blockpin signalname="XLXN_12" name="B" />
            <blockpin signalname="XLXN_3" name="Cin" />
            <blockpin signalname="XLXN_7" name="Sum" />
            <blockpin signalname="XLXN_9" name="Cout" />
        </block>
        <block symbolname="fadder" name="XLXI_3">
            <blockpin signalname="XLXN_13" name="A" />
            <blockpin signalname="XLXN_14" name="B" />
            <blockpin signalname="XLXN_2" name="Cin" />
            <blockpin signalname="XLXN_6" name="Sum" />
            <blockpin signalname="XLXN_3" name="Cout" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1392" y="1840" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1392" y="2160" name="XLXI_5" orien="R0">
        </instance>
        <instance x="1392" y="1200" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1392" y="1520" name="XLXI_3" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1392" y1="1808" y2="1808" x1="1328" />
            <wire x2="1328" y1="1808" y2="1872" x1="1328" />
            <wire x2="1824" y1="1872" y2="1872" x1="1328" />
            <wire x2="1824" y1="1872" y2="2000" x1="1824" />
            <wire x2="1824" y1="2000" y2="2000" x1="1776" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1392" y1="1488" y2="1488" x1="1328" />
            <wire x2="1328" y1="1488" y2="1552" x1="1328" />
            <wire x2="1824" y1="1552" y2="1552" x1="1328" />
            <wire x2="1824" y1="1552" y2="1680" x1="1824" />
            <wire x2="1824" y1="1680" y2="1680" x1="1776" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1392" y1="1168" y2="1168" x1="1328" />
            <wire x2="1328" y1="1168" y2="1232" x1="1328" />
            <wire x2="1808" y1="1232" y2="1232" x1="1328" />
            <wire x2="1808" y1="1232" y2="1360" x1="1808" />
            <wire x2="1808" y1="1360" y2="1360" x1="1776" />
        </branch>
        <branch name="S0asd">
            <wire x2="1968" y1="2128" y2="2128" x1="1776" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1968" y1="1808" y2="1808" x1="1776" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1968" y1="1488" y2="1488" x1="1776" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1968" y1="1168" y2="1168" x1="1776" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1968" y1="1040" y2="1040" x1="1776" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1392" y1="1360" y2="1360" x1="1216" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1392" y1="1424" y2="1424" x1="1216" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1392" y1="1744" y2="1744" x1="1216" />
        </branch>
        <branch name="XLXN_17">
            <wire x2="1392" y1="2000" y2="2000" x1="1216" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1392" y1="2064" y2="2064" x1="1216" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="1392" y1="2128" y2="2128" x1="1216" />
        </branch>
        <rect width="612" x="1284" y="916" height="1292" />
        <branch name="XLXN_12">
            <wire x2="1392" y1="1104" y2="1104" x1="1216" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1392" y1="1680" y2="1680" x1="1216" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="1232" y1="1040" y2="1040" x1="1216" />
            <wire x2="1248" y1="1040" y2="1040" x1="1232" />
            <wire x2="1392" y1="1040" y2="1040" x1="1248" />
        </branch>
        <text style="fontsize:48;fontname:Arial" x="1140" y="1044">A3</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="1108">B3</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="1364">A2</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="1428">B2</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="1684">A1</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="1748">B1</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="2004">A0</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="2068">B0</text>
        <text style="fontsize:48;fontname:Arial" x="1140" y="2132">Cin</text>
        <text style="fontsize:48;fontname:Arial" x="1988" y="1040">Cout</text>
        <text style="fontsize:48;fontname:Arial" x="1992" y="1488">S2</text>
        <text style="fontsize:48;fontname:Arial" x="1992" y="2128">S0</text>
        <text style="fontsize:48;fontname:Arial" x="1992" y="1808">S1</text>
        <text style="fontsize:48;fontname:Arial" x="1992" y="1168">S3</text>
        <text style="fontsize:64;fontname:Arial" x="1468" y="856">fadder_4bit</text>
        <instance x="384" y="1408" name="XLXI_2" orien="R0">
        </instance>
    </sheet>
</drawing>