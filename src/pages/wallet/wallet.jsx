import { WALLET_HISTORY } from 'shared/api/mocks';
import { useToast } from 'shared/lib/toast';
export const WalletPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>Мой <span style={{ color: '#FBA457' }}>кошелек</span></h1>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 20, maxWidth: 900, margin: '0 auto 40px' }}>
            <div style={{ background: '#F5F5F7', borderRadius: 12, padding: 24, textAlign: 'center' }}>
              <div style={{ fontSize: 13, color: '#8B8B8B', marginBottom: 8 }}>Чистый доход</div>
              <div style={{ fontSize: 18, fontWeight: 700 }}>1 000 000 тенге</div>
            </div>
            <div style={{ background: '#F5F5F7', borderRadius: 12, padding: 24, textAlign: 'center' }}>
              <div style={{ fontSize: 13, color: '#8B8B8B', marginBottom: 8 }}>Выведено</div>
              <div style={{ fontSize: 18, fontWeight: 700 }}>500 000 тенге</div>
            </div>
            <div style={{ background: '#F5F5F7', borderRadius: 12, padding: 24, textAlign: 'center' }}>
              <div style={{ fontSize: 13, color: '#8B8B8B', marginBottom: 8 }}>Доступна сумма</div>
              <div style={{ fontSize: 20, fontWeight: 700, color: '#21B349' }}>250 000 тенге</div>
            </div>
          </div>
          <div style={{ maxWidth: 600, margin: '0 auto 40px', textAlign: 'center' }}>
            <div style={{ fontSize: 14, color: '#8B8B8B', marginBottom: 16 }}>Вывести средства на</div>
            <div style={{ display: 'flex', gap: 16, justifyContent: 'center', flexWrap: 'wrap' }}>
              {['QIWI', 'WebMoney', 'VISA', 'MC'].map(p => (
                <div key={p} onClick={() => toast(`Вывод на ${p}`)} style={{ padding: '12px 24px', background: 'white', border: '1px solid #E5E5E5', borderRadius: 8, fontWeight: 700, cursor: 'pointer' }}>{p}</div>
              ))}
            </div>
          </div>
          <h2 className="section-title">История</h2>
          <div style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
            <div style={{ display: 'grid', gridTemplateColumns: '60px 1fr 200px 200px 1fr', padding: 16, background: '#F5F5F7', fontWeight: 700, fontSize: 13 }}>
              <div></div><div>Операция</div><div>Дата операции</div><div>Сумма</div><div>Hash операции</div>
            </div>
            {WALLET_HISTORY.map(h => (
              <div key={h.id} style={{ display: 'grid', gridTemplateColumns: '60px 1fr 200px 200px 1fr', padding: 16, borderTop: '1px solid #F0F0F0', alignItems: 'center', fontSize: 13 }}>
                <div style={{ width: 36, height: 36, borderRadius: '50%', background: h.type === 'in' ? '#E8F7EC' : h.type === 'out' ? '#F5F0FF' : '#FFE4CC', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>{h.type === 'in' ? '+' : h.type === 'out' ? '↑' : '🛒'}</div>
                <div>{h.operation}</div>
                <div style={{ color: '#8B8B8B' }}>{h.date}</div>
                <div style={{ fontWeight: 700 }}>{h.amount.toLocaleString()} тенге</div>
                <div style={{ color: '#8B8B8B', fontSize: 11 }}>{h.hash}</div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
