#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT(KC_ESC, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_PSCR, KC_SCRL, KC_PAUS, TG(1), QK_BOOT, KC_EQL, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSLS, LCTL_T(KC_CAPS), KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, RALT_T(KC_QUOT), KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT, KC_GRV, KC_INS, KC_LEFT, KC_RGHT, KC_UP, KC_DOWN, KC_LBRC, KC_RBRC, KC_LALT, OSM(MOD_MEH), KC_RCTL, KC_RGUI, KC_HOME, KC_PGUP, KC_BSPC, KC_DEL, KC_END, MEH_T(KC_PGDN), KC_ENT, RCTL_T(KC_SPC)),

    // Layer 1: left-hand Excalidraw layer (pen in right hand). Num LED lights while active.
    //   1-5 stay native (select/rect/diamond/ellipse/arrow), Q-T give tools 6-0
    //   (line/draw/text/image/eraser), Tab = hand tool, B = lock tool,
    //   F1/F2 = zoom out/in, F3 = zoom to fit, Backspace thumb = Space for panning.
    [1] = LAYOUT(_______, C(KC_MINS), C(KC_EQL), S(KC_1), _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, TG(1), _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_H, KC_6, KC_7, KC_8, KC_9, KC_0, _______, _______, _______, _______, _______, _______, _______, C(KC_Z), S(C(KC_Z)), KC_DEL, C(KC_D), C(KC_G), _______, _______, _______, _______, _______, _______, _______, C(KC_Z), C(KC_X), C(KC_C), C(KC_V), KC_Q, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_SPC, _______, _______, _______, _______, _______)
};

// Caps Lock LED still tracks host caps lock; returning false keeps the host
// from driving the other three LEDs, which are used as layer indicators.
bool led_update_user(led_t led_state) {
    gpio_write_pin(LED_CAPS_LOCK_PIN, led_state.caps_lock ? LED_PIN_ON_STATE : !LED_PIN_ON_STATE);
    return false;
}

// Num = layer 1, Scroll = layer 2, Keypad = layer 3.
layer_state_t layer_state_set_user(layer_state_t state) {
    gpio_write_pin(LED_NUM_LOCK_PIN,    layer_state_cmp(state, 1) ? LED_PIN_ON_STATE : !LED_PIN_ON_STATE);
    gpio_write_pin(LED_SCROLL_LOCK_PIN, layer_state_cmp(state, 2) ? LED_PIN_ON_STATE : !LED_PIN_ON_STATE);
    gpio_write_pin(LED_COMPOSE_PIN,     layer_state_cmp(state, 3) ? LED_PIN_ON_STATE : !LED_PIN_ON_STATE);
    return state;
}
