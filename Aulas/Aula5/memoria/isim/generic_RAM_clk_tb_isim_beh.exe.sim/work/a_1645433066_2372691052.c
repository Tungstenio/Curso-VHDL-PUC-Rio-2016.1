/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/CLEAN/Aula5/memoria/src/generic_RAM_clk_tb.vhd";
extern char *IEEE_P_3499444699;
extern char *IEEE_P_3620187407;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1645433066_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 3760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3760);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1645433066_2372691052_p_1(char *t0)
{
    char t15[16];
    char t21[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    unsigned char t10;
    unsigned char t11;
    int64 t12;
    int t13;
    int t14;
    int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 3360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 6960);
    t4 = (t0 + 3824);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(65, ng0);
    t9 = (50 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(66, ng0);

LAB10:    t2 = (t0 + 3680);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t3 = (t0 + 3680);
    *((int *)t3) = 0;
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t9);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t9);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 6965);
    t4 = (t0 + 3952);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 5);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 4016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t9);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 4016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 5);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 2);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 4016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 5);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 5);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 6981);
    t4 = (t0 + 3824);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 2);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 6986);
    t4 = (t0 + 3824);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 5);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 6991);
    t4 = (t0 + 3824);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 4016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 6996);
    *((int *)t2) = 0;
    t3 = (t0 + 7000);
    *((int *)t3) = 31;
    t13 = 0;
    t14 = 31;

LAB52:    if (t13 <= t14)
        goto LAB53;

LAB55:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 5);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB67:    *((char **)t1) = &&LAB68;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB53:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 6996);
    t16 = (15 + 1);
    t5 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t15, *((int *)t4), t16);
    t6 = (t15 + 12U);
    t17 = *((unsigned int *)t6);
    t17 = (t17 * 1U);
    t10 = (16U != t17);
    if (t10 == 1)
        goto LAB56;

LAB57:    t7 = (t0 + 3952);
    t8 = (t7 + 56U);
    t18 = *((char **)t8);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t5, 16U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t9);

LAB60:    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB54:    t2 = (t0 + 6996);
    t13 = *((int *)t2);
    t3 = (t0 + 7000);
    t14 = *((int *)t3);
    if (t13 == t14)
        goto LAB55;

LAB64:    t16 = (t13 + 1);
    t13 = t16;
    t4 = (t0 + 6996);
    *((int *)t4) = t13;
    goto LAB52;

LAB56:    xsi_size_not_matching(16U, t17, 0);
    goto LAB57;

LAB58:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 6856U);
    t4 = (t0 + 7004);
    t6 = (t21 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t16 = (0 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t17;
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t15, t3, t2, t4, t21);
    t8 = (t15 + 12U);
    t17 = *((unsigned int *)t8);
    t22 = (1U * t17);
    t10 = (5U != t22);
    if (t10 == 1)
        goto LAB62;

LAB63:    t18 = (t0 + 3824);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t23 = (t20 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t7, 5U);
    xsi_driver_first_trans_fast(t18);
    goto LAB54;

LAB59:    goto LAB58;

LAB61:    goto LAB59;

LAB62:    xsi_size_not_matching(5U, t22, 0);
    goto LAB63;

LAB65:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 7005);
    t4 = (t0 + 3824);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 7010);
    *((int *)t2) = 0;
    t3 = (t0 + 7014);
    *((int *)t3) = 31;
    t13 = 0;
    t14 = 31;

LAB69:    if (t13 <= t14)
        goto LAB70;

LAB72:    xsi_set_current_line(114, ng0);

LAB82:    *((char **)t1) = &&LAB83;
    goto LAB1;

LAB66:    goto LAB65;

LAB68:    goto LAB66;

LAB70:    xsi_set_current_line(109, ng0);
    t4 = (t0 + 2128U);
    t5 = *((char **)t4);
    t9 = *((int64 *)t5);
    t4 = (t0 + 3168);
    xsi_process_wait(t4, t9);

LAB75:    *((char **)t1) = &&LAB76;
    goto LAB1;

LAB71:    t2 = (t0 + 7010);
    t13 = *((int *)t2);
    t3 = (t0 + 7014);
    t14 = *((int *)t3);
    if (t13 == t14)
        goto LAB72;

LAB79:    t16 = (t13 + 1);
    t13 = t16;
    t4 = (t0 + 7010);
    *((int *)t4) = t13;
    goto LAB69;

LAB73:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 6856U);
    t4 = (t0 + 7018);
    t6 = (t21 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t16 = (0 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t17;
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t15, t3, t2, t4, t21);
    t8 = (t15 + 12U);
    t17 = *((unsigned int *)t8);
    t22 = (1U * t17);
    t10 = (5U != t22);
    if (t10 == 1)
        goto LAB77;

LAB78:    t18 = (t0 + 3824);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t23 = (t20 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t7, 5U);
    xsi_driver_first_trans_fast(t18);
    goto LAB71;

LAB74:    goto LAB73;

LAB76:    goto LAB74;

LAB77:    xsi_size_not_matching(5U, t22, 0);
    goto LAB78;

LAB80:    goto LAB2;

LAB81:    goto LAB80;

LAB83:    goto LAB81;

}


extern void work_a_1645433066_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1645433066_2372691052_p_0,(void *)work_a_1645433066_2372691052_p_1};
	xsi_register_didat("work_a_1645433066_2372691052", "isim/generic_RAM_clk_tb_isim_beh.exe.sim/work/a_1645433066_2372691052.didat");
	xsi_register_executes(pe);
}
