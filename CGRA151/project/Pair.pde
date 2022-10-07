public class Pair<P, Q> {
    P pValue;
    Q qValue;

    public P key() {
        return pValue;
    }

    public Q value() {
        return qValue;
    }

    public Pair(P pValue, Q qValue) {
        this.pValue = pValue;
        this.qValue = qValue;
    }
}