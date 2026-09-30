export const HowToSolve = () => (
  <section style={{ padding: '60px 0', background: '#FAFAFA' }}>
    <div className="container">
      <h2 className="section-title">Как решать задачи на WorkTap?</h2>
      <a href="/" style={{ color: '#21B349', fontSize: 14, fontWeight: 600, display: 'inline-block', marginBottom: 32 }}>Идеально подходит для бизнеса и частных лиц</a>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 40 }}>
        {[{ t: 'Выберите услугу', d: 'В супермаркете WorkTap представлен широкий выбор услуг от квалифицированных специалистов.' }, { t: 'Оплатите', d: 'Деньги будут перечислены продавцу после того, как он выполнит работу, и вы её одобрите.' }, { t: 'Получите результат', d: 'Наш супермаркет гарантирует вам возврат средств в полном объёме в случае невыполнения заказа.' }].map((s, i) => (
          <div key={i}>
            <div style={{ fontSize: 48, marginBottom: 16 }}>{['👤','💳','📄'][i]}</div>
            <h3 style={{ fontSize: 18, fontWeight: 700, marginBottom: 12 }}>{s.t}</h3>
            <p style={{ fontSize: 14, color: '#8B8B8B', lineHeight: 1.6 }}>{s.d}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);
