<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="ShiftRegister">
            <timestamp>2016-3-15T17:47:9</timestamp>
            <rect width="304" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
        </blockdef>
        <block symbolname="ShiftRegister" name="XLXI_1">
            <blockpin name="LOCAL_CLOCK" />
            <blockpin name="LOAD" />
            <blockpin name="ENABLE" />
            <blockpin name="DATA_IN(7:0)" />
            <blockpin name="DATA_OUT" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1376" y="928" name="XLXI_1" orien="R0">
        </instance>
    </sheet>
</drawing>