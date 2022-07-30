class Maths {
    boolean rBool() {
        return random(1) > 0.5;
    }
    
    boolean rChance(float percentage) {
        return random(1) < percentage / 100;
    }
}