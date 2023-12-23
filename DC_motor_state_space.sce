scheme = "DC_motor_state_space.zcos";

// Import model
importXcosDiagram(scheme);
// Parameters
ctx = ["m = 0.1; r = 0.05; J = 0.5*m*r^2; b = 0.0000095; kt = 0.0187; R = 0.6; L = 0.35/1000; ke = 0.0191;"];
scs_m.props.context = ctx;
// Simulate
xcos_simulate(scs_m, 4);

// Draw
show_window(1);
subplot(311);
h = plot(omega_out.time, omega_out.values, 'b-', ss_out.time, ss_out.values(:, 2), 'r--', 'LineWidth',3);
l = legend("Differential equation", "State space");
l.font_size = 3;
ax=gca();
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Angular speed [rad/s]', 'font_style', 'times bold', 'font_size', 3);

subplot(312);
h = plot(current_out.time, current_out.values, 'b-', ss_out.time, ss_out.values(:, 3), 'r--', 'LineWidth',3);
l = legend("Differential equation", "State space");
l.font_size = 3;
ax=gca();
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Current [A]', 'font_style', 'times bold', 'font_size', 3);

subplot(313);
h = plot(theta_out.time, theta_out.values, 'b-', ss_out.time, ss_out.values(:, 1), 'r--', 'LineWidth',3);
l = legend("Differential equation", "State space");
l.font_size = 3;
ax=gca();
set(gca(),"grid",[1 1]);
xlabel('Time [s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Angular position [rad]', 'font_style', 'times bold', 'font_size', 3);


