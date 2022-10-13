// Represents a pair of data. Conceptually acts as a single entry map.
public class Pair<P, Q> {
    P pValue;
    Q qValue;

    public P key() {
        return pValue;
    }

    public Q value() {
        return qValue;
    }

    public void setValue(Q v) {
        qValue = v;
    }
    public void setKey(P v) {
        pValue = v;
    }

    public Pair(P pValue, Q qValue) {
        this.pValue = pValue;
        this.qValue = qValue;
    }

    public Pair() {
        pValue = null;
        qValue = null;
    }
}