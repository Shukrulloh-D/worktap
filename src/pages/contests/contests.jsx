export const ContestsPage = () => (
  <div className="pageFadeIn">
    <section style={{ padding: '60px 0' }}>
      <div className="container">
        <h1 className="section-title">Конкурсы</h1>
        <div style={{ background: 'white', borderRadius: 16, padding: 40, boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
          <div style={{ display: 'flex', gap: 12, marginBottom: 40, flexWrap: 'wrap' }}>
            {['Что такое конкурс?','Основное','Описание','Оплата','Публикация'].map((s, i) => (
              <div key={s} style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <div style={{ width: 32, height: 32, borderRadius: '50%', background: i === 0 ? '#21B349' : '#E5E5E5', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, fontSize: 13 }}>{i + 1}</div>
                <span style={{ fontSize: 13, fontWeight: 500, color: i === 0 ? '#21B349' : '#8B8B8B' }}>{s}</span>
              </div>
            ))}
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 24 }}>
            {[{ t: 'Опубликуйте бриф', d: 'Зарезервируйте бюджет конкурса, и мы уведомим всех исполнителей.' }, { t: 'Получайте варианты', d: 'Участники будут присылать вам готовые работы, которые вы сможете оценивать.' }, { t: 'Выберите победителя', d: 'Определитесь с наилучшей работой на стадии финала и выберите ее победителем.' }, { t: 'Получите готовую работу', d: 'Проведите доработки в рабочей области, если это необходимо.' }].map((s, i) => (
              <div key={i}>
                <div style={{ fontSize: 40, marginBottom: 12 }}>{['📋','🎨','🏆','📦'][i]}</div>
                <h3 style={{ fontSize: 15, fontWeight: 700, marginBottom: 8 }}>{s.t}</h3>
                <p style={{ fontSize: 12, color: '#8B8B8B', lineHeight: 1.6 }}>{s.d}</p>
              </div>
            ))}
          </div>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 40 }}>
            <button className="btn btn-ghost">Назад</button>
            <button className="btn btn-primary">Дальше</button>
          </div>
        </div>
      </div>
    </section>
  </div>
);
