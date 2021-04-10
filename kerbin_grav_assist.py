import equations as equ
import bodies
import math
'''
Note
This still needs to account for the way SOI effects it. Such as, the perihelion actually being ahead of kerbin.
'''
equ.t = 6
trgT = 4.1*equ.kerbin_orbit.Tfa()
orbit = equ.orbit
ellipse = equ.orbit_ellipse
hyper = equ.orbit_hyper
body = bodies.bodycls
hm = equ.hyper_mean
m = equ.mean
tr = equ.true
in_guess = 2.1*equ.kerbin_orbit.Tfa()
one_orb = orbit(bodies.kerbol.u, ellipse(bodies.kerbol.u, in_guess, 0, 0, 0, 0).afT(),ellipse(bodies.kerbol.u, in_guess, 0, 0, 0, equ.kerbin_orbit.a).efT_pe(), math.pi, 0, 0, 0) #Note: epoch is ht, and in_mean is actually m(equ.kerbin_orbit, ht).cur_mean()+bodies.kerbin.soi/equ.kerbin_orbit.a
def diff(cls): #diff is measured in true anomaly
    #first_orb_prt2 = orbit(first_orb.u, 1.6*equ.kerbin_orbit.a, .5, math.pi, math.pi, in_guess, math.pi)
    v = one_orb.vf_true_a()-equ.kerbin_orbit.vf_true_a()
    print(v)
    ht = hm(hyper(bodies.kerbin.u, v, 84*10**6, 0, 670000), hyper(bodies.kerbin.u, v, 84*10**6, 0, 670000).t_anfalt_pe_v()).time()
    one_elps_p2 = ellipse(equ.u_s, 0, 0, equ.kerbin_orbit.a, one_orb.apfa_e(),1.1864513*10**10)
    print(one_elps_p2.pe-bodies.kerbol.r)
    tr_at_int = one_elps_p2.tr_anfalt_pe_ap()
    arg_per = m(equ.kerbin_orbit, ht).cur_mean() + bodies.kerbin.soi/equ.kerbin_orbit.a
    one_orb_p2 = orbit(one_orb.u, one_elps_p2.afpe_ap(), one_elps_p2.efpe_ap(), arg_per, math.pi, in_guess/2+ht, tr_at_int)
    t = in_guess/2+(one_orb_p2.mean_anomaly()+math.pi)*one_orb_p2.Tfa()/math.tau + ht
    me_k = m(equ.kerbin_orbit,t).cur_mean()
    #print(me_k-arg_per)
    tr_k = tr(equ.kerbin_orbit, me_k).true_anomaly()
    #print(tr_k)
    print(f'day: {ht//(3600*6)}, hour: {(ht%(3600*6))/3600}')
    print(ht)
    return tr_k - equ.kerbin_orbit.in_mean - (tr_at_int+arg_per-equ.kerbin_orbit.in_mean)
print(diff(orbit)) #The error is that kerbin is behind (guessed periapse to small) only by 20 million meters though (but this about a half degree off)
#print(hm(hyper(bodies.kerbin.u, 1000, 84*10**6, 0, 670000), hyper(bodies.kerbin.u, 1000, 84*10**6, 0, 670000).t_anfalt_pe_v()).time())
#print(hm(hyper(bodies.kerbin.u, 1600, 84*10**6, 0, 670000), hyper(bodies.kerbin.u, 1600, 84*10**6, 0, 670000).t_anfalt_pe_v()).time())
#print(one_orb.vf_true_a()-equ.kerbin_orbit.vf_true_a())
#print(math.sqrt(2)*math.sqrt(bodies.kerbin.u/(bodies.kerbin.r+70000)))
'''
print(one_orb.apfa_e())'''
print(one_orb.apfa_e()-bodies.kerbol.r)
#print(1.18465*10**10-bodies.kerbol.r)

#print(orb.cfcur_true())
#print(bodies.kerbol.u)
'''print(craft2.a)
print(one_orb.apfa_e())'''
#one_elps_p2 = ellipse(equ.u_s, 0, 0, equ.kerbin_orbit.a, one_orb.apfa_e(),1.3*10**10)
